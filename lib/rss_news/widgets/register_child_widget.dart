import 'package:flutter/material.dart';
import 'package:flutter_browser/Db/hive_db_helper.dart';
import 'package:flutter_browser/rss_news/utils/show_snackbar.dart';

class RegisterChildWidget extends StatefulWidget {
  const RegisterChildWidget({super.key});

  @override
  State<RegisterChildWidget> createState() => _RegisterChildWidgetState();
}

class _RegisterChildWidgetState extends State<RegisterChildWidget> {
  late String deviceId;

  void showAddingDialog({int? editIndex}) async {
    String? id = "";
    if (editIndex != null) {
      id = HiveDBHelper.getchildIdAtIndex(editIndex);
    }
    TextEditingController deviceNameController =
        TextEditingController(text: id);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(editIndex != null ? "Edit Device Id" : "Add Device Id"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) => id = value,
              controller: deviceNameController,
              decoration: const InputDecoration(labelText: "Child Device Id"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              if (id == null) {
                // If any field is empty, show an error or do not allow saving
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Error"),
                    content: const Text("All fields are required."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the error dialog
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              } else {
                if (editIndex != null) {
                  // If editing, update the rule at the editIndex
                 await HiveDBHelper.removeChildId(editIndex);
                 await  HiveDBHelper.addChildDevice(id!);
                } else {
                  await HiveDBHelper.addChildDevice(id!);
                }
                // debugPrint(rules.toString());
                Navigator.pop(context);
              }
              debugPrint(HiveDBHelper.getAllChildDevices().toString());
            },
            child: Text(editIndex == null ? "Add" : "Save"),
          ),
          if (editIndex != null)
            TextButton(
              onPressed: () async {
              await  HiveDBHelper.removeChildId(editIndex);
                Navigator.pop(context);
              },
              // Disable the button if editIndex is null
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            )
        ],
      ),
    );
  }

  List<Widget> showIds(List<String> childDevices) {
    if (childDevices.isNotEmpty) {
      return childDevices.asMap().entries.map((entry) {
        final index = entry.key;
        final id = entry.value;
        return ListTile(
          title: Text(id), // Use rule properties
          onTap: () {
            Navigator.pop(context); // Close the dialog
            showAddingDialog(
              editIndex: index,
            );
          },
        );
      }).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Add Child'),
          subtitle:
              const Text('Add a Child Device for Parental Control options'),
          trailing: Wrap(
            spacing: 12,
            children: [
              IconButton(
                  onPressed: showAddingDialog,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  )),
              IconButton(
                onPressed: () {
                  final childDevices = HiveDBHelper.getAllChildDevices();
                  if (childDevices.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Choose an Id to Edit"),
                        content: SizedBox(
                          height: 300.0, // Adjust height as needed
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [...showIds(childDevices)],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    showSnackBar(message: "Add a Child Device First");
                  }
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
