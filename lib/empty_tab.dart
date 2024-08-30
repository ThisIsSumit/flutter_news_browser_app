import 'package:flutter/material.dart';
import 'package:flutter_browser/src/screens/home_screen.dart';
import 'package:flutter_browser/src/screens/language_selection_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EmptyTab extends StatefulWidget {
  const EmptyTab({super.key});

  @override
  State<EmptyTab> createState() => _EmptyTabState();
}

class _EmptyTabState extends State<EmptyTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 300.0),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<List<String>>('preferences').listenable(),
        builder: (BuildContext context, Box<List<String>> box, Widget? child) {
          final sources = box.get('selectedSources');
          // debugPrint('lam'+language.toString());
          return Column(
            children: [
              if (sources != null && sources.isNotEmpty)
                const Expanded(child: HomeScreen())
              else
                const Expanded(child: LanguageSelectionScreen())
            ],
          );
        },
      ),
    );
  }
}
