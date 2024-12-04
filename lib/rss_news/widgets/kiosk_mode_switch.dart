import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_browser/Db/hive_db_helper.dart';
import 'package:flutter_browser/rss_news/utils/debug.dart';
import 'package:flutter_browser/rss_news/utils/show_snackbar.dart';

class KioskModeSwitch extends StatefulWidget {
  const KioskModeSwitch({super.key});

  @override
  KioskModeSwitchState createState() => KioskModeSwitchState();
}

class KioskModeSwitchState extends State<KioskModeSwitch> {
  bool _isKioskModeEnabled =
      HiveDBHelper.getKioskMode(); // Initial value for the switch
  final String _correctPassword = "qwerty"; // Set your desired password here

  static const platform =
      MethodChannel('com.pichillilorenzo.flutter_browser.intent_data');

  // Method to start the service
  void _startService() async {
    try {
      final String result = await platform.invokeMethod('startService');
      debug(result);
    } on PlatformException catch (e) {
      debug("Failed to invoke method: '${e.message}'.");
    }
  }

  // Method to request accessibility permission
  void _requestAccessibilityPermission() async {
    try {
      final String result =
          await platform.invokeMethod('requestAccessibilityPermission');
      debug(result);
    } on PlatformException catch (e) {
      debug("Failed to invoke method: '${e.message}'.");
    }
  }

  // Show password dialog to disable kiosk mode
  void _showPasswordDialog() {
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Password"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text == _correctPassword) {
                  setState(() {
                    _isKioskModeEnabled = false;
                    HiveDBHelper.setKioskMode(false);
                    _setKioskMode(false); // Disable Kiosk mode
                  });
                  Navigator.of(context).pop(); // Close the dialog
                } else {
                  Navigator.of(context).pop();
                  showSnackBar(message: "Incorrect password");
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Method to handle the switch change
  void _onKioskModeChanged(bool value) {
    if (value) {
      // If turning on Kiosk Mode, first check for permission
      _checkPermissionsAndStartService();
    } else {
      // If turning off Kiosk Mode, show the password dialog
      _showPasswordDialog();
    }
  }

  // Method to update the kiosk mode status in the service
  void _setKioskMode(bool enabled) async {
    try {
      await platform.invokeMethod('setKioskMode', {'enabled': enabled});
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  // Check if the permissions are set and request if not
  void _checkPermissionsAndStartService() async {
    // You can check the permission status here (you might need a plugin for this)
    // If permissions are not granted, request permission
    _startService();
    _requestAccessibilityPermission();

    // Start the service after requesting permission
    setState(() {
      _isKioskModeEnabled = true;
      HiveDBHelper.setKioskMode(true);
    });

    // Notify service to start blocking apps
    _setKioskMode(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Kiosk mode"),
          subtitle: const Text("Restricts device to run this specific app"),
          value: _isKioskModeEnabled,
          onChanged: _onKioskModeChanged, // Use the updated onChanged callback
        ),
      ],
    );
  }
}
