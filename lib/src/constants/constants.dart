import 'package:flutter/material.dart';

enum Language {
  // ignore: constant_identifier_names
  English,
  Hindi,
  Telugu
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
