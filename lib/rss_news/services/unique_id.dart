import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_browser/rss_news/utils/show_snackbar.dart';
import 'package:unique_identifier/unique_identifier.dart';

class UniqueId {
  static Future<String> initUniqueIdentifierState() async {
    String? identifier;
    try {
      identifier = await UniqueIdentifier.serial;
    } on PlatformException {
      showSnackBar(message: 'Failed to get Unique Identifier');
      identifier = null;
    }
    debugPrint(identifier.toString());
    return identifier.toString();
  }
}
