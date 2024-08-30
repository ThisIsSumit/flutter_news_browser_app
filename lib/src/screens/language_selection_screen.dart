import 'package:flutter/material.dart';
import 'package:flutter_browser/src/screens/category_selection_screen.dart';
import 'package:hive_flutter/adapters.dart';

import '../constants/constants.dart';


class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({
    super.key,
  });

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  List<String> selectedLanguages = [];

  Future<void> _handleLanguageSelection(Language language, bool isSelected) async {
    setState(() {
      if (isSelected) {
        selectedLanguages.add(language.name.substring(0,2).toLowerCase());
      } else {
        selectedLanguages.remove(language.name.substring(0,2).toLowerCase());
      }
    });

  }

  Future<void> _submit() async {
    if (selectedLanguages.isNotEmpty) {

      final box = Hive.box<List<String>>('preferences');
      await box.put('selectedLanguages', selectedLanguages.map((e) => e.toString()).toList());
      // debugPrint(selectedLanguages.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CategoriesSelectionScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one language.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.lightBlue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Languages',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: Language.values.map((language) {
                    return CheckboxListTile(
                      title: Text(
                        language.toString().split('.').last,
                        style: const TextStyle(fontSize: 18),
                      ),
                      value: selectedLanguages.contains(language.name.substring(0,2).toLowerCase()),
                      onChanged: (bool? value) {
                        if (value != null) {
                          _handleLanguageSelection(language, value);
                        }
                      },
                      activeColor: Colors.lightBlue,
                    );
                  },).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
