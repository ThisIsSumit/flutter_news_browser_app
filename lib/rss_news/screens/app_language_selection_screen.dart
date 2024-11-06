import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/screens/welcome_screen.dart';

class AppLanguageSelectionScreen extends StatefulWidget {
  @override
  _AppLanguageSelectionScreenState createState() =>
      _AppLanguageSelectionScreenState();
}

class _AppLanguageSelectionScreenState
    extends State<AppLanguageSelectionScreen> {
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'Hindi', 'code': 'hi'},
    {'name': 'Kannada', 'code': 'kd'}
  ];

  // Store the selected language
  String? selectedLanguageCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Select App Language'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display available languages as a list of radio buttons
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    title: Text(languages[index]['name']!),
                    value: languages[index]
                        ['code']!, // Set the value to the language code
                    groupValue: selectedLanguageCode, // Current selected value
                    onChanged: (String? value) {
                      setState(() {
                        selectedLanguageCode =
                            value; // Update the selected language
                      });
                    },
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: selectedLanguageCode != null
                  ? () => _onLanguageSelected(context)
                  : null, // Disable the button if no language is selected
              child: const Text(
                'Continue',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle language selection and navigate to the WelcomeScreen
  void _onLanguageSelected(BuildContext context) {
    if (selectedLanguageCode != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(
              selectedLanguage:
                  selectedLanguageCode!), // Pass the selected language code
        ),
      );
    }
  }
}
