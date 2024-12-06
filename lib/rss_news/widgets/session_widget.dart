// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_browser/Db/hive_db_helper.dart';
import 'package:flutter_browser/rss_news/grpahql/graphql_requests.dart';
import 'package:flutter_browser/rss_news/utils/debug.dart';

class SessionWidget extends StatefulWidget {
  const SessionWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SessionWidgetState createState() => _SessionWidgetState();
}

class _SessionWidgetState extends State<SessionWidget> {
  Timer? timer;
  Map<String, Map<String, List<Map<String, String>>>> groupedBooks = {};
  @override
  void initState() {
    super.initState();
    _startTokenExpirationCheck();
    getBooks();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startTokenExpirationCheck() {
    // Check token expiration every minute
    timer = Timer.periodic(
      const Duration(minutes: 10),
      (timer) async {
        DateTime? expirationTime = HiveDBHelper.getToken();
        debugPrint('lllllllll$expirationTime');
        // ignore: unnecessary_null_comparison
        if (expirationTime != null && DateTime.now().isAfter(expirationTime)) {
          showAddingDialog();
        } else {
          debug('something is null');
        }
      },
    );
  }

  void getBooks() async {
    final books = await GraphQLRequests().getBooks();
    if (books != null) {
      for (var book in books) {
        // Group by board
        if (!groupedBooks.containsKey(book.board)) {
          groupedBooks[book.board!] = {};
        }

        // Group by class within the board
        if (!groupedBooks[book.board]!.containsKey(book.classNumber)) {
          groupedBooks[book.board]![book.classNumber!] = [];
        }

        // Add subject with ID to the class list
        groupedBooks[book.board]![book.classNumber!]!.add({
          'id': book.id!,
          'subject': book.subject!,
        });
        // debug(groupedBooks);/
      }
    }
  }

  void showAddingDialog() async {
    List<String>? boards = groupedBooks.keys.toList();
    List<String>? classNames = [];
    List<String>? subjects = [];
    String? className;
    String? subject;
    String? chapter;
    String? topic;
    String? subtopic;
    String? duration;
    String? selectedBoard;
    TextEditingController subjectController =
        TextEditingController(text: subject ?? '');
    TextEditingController chapterController =
        TextEditingController(text: chapter ?? '');
    TextEditingController topicController =
        TextEditingController(text: topic ?? '');
    TextEditingController subtopicController =
        TextEditingController(text: subtopic ?? '');
    TextEditingController durationController =
        TextEditingController(text: duration ?? " ");

    showDialog(
      context: context,
      //  Prevent the dialog from being dismissed by tapping outside
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text("Create Session"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedBoard, // Selected board variable
                    items: boards.map((String board) {
                      return DropdownMenuItem(
                        value: board,
                        child: Text(board), // Display board name
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedBoard = value; // Update selected board
                        classNames = selectedBoard != null
                            ? groupedBooks[selectedBoard]!.keys.toList()
                            : [];

                        // Reset className when the board changes
                        className = null;

                        // Sort class names
                        if (classNames != null) {
                          classNames?.sort(
                              (a, b) => int.parse(a).compareTo(int.parse(b)));
                        }
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Select Board",
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: className,
                    items: classNames!.map((String className) {
                      return DropdownMenuItem(
                        value: className,
                        child: Text("Class $className"),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        className = value;
                        // subjects=
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Select Class",
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: subject,
                    items: subjects.map((String className) {
                      return DropdownMenuItem(
                        value: className,
                        child: Text("Class $className"),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        subject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Select Class",
                    ),
                  ),
                  TextField(
                    onChanged: (value) => subject = value,
                    controller: subjectController,
                    decoration: const InputDecoration(labelText: "Subject"),
                  ),
                  TextField(
                    onChanged: (value) => chapter = value,
                    controller: chapterController,
                    decoration: const InputDecoration(labelText: "Chapter"),
                  ),
                  TextField(
                    onChanged: (value) => topic = value,
                    controller: topicController,
                    decoration: const InputDecoration(labelText: "Topic"),
                  ),
                  TextField(
                    onChanged: (value) => subtopic = value,
                    controller: subtopicController,
                    decoration: const InputDecoration(labelText: "Subtopic"),
                  ),
                  TextField(
                    onChanged: (value) => duration = value,
                    controller: durationController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Duration (in minutes)"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                onPressed: () async {
                  if (className == null ||
                      subtopic == null ||
                      subject == null ||
                      duration == null ||
                      chapter == null ||
                      topic == null) {
                    // If any field is empty, show an error
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
                    // If all fields are filled, save the data
                    final op = await GraphQLRequests().createSession(
                        className!,
                        subject!,
                        topic!,
                        chapter!,
                        subtopic!,
                        int.parse(duration!));
                    debug(op);
                    if (op != null) {
                      final expirationTime =
                          DateTime.now().add(const Duration(minutes: 60));
                      debug(expirationTime);
                      await HiveDBHelper.setToken(expirationTime);
                    }
                    Navigator.pop(context); // Close the dialog after submission
                  }
                },
                child: const Text("Add"),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Create a Session"),
          subtitle: const Text("Creates current Session"),
          trailing: Wrap(
            spacing: 12,
            children: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.green),
                onPressed: showAddingDialog,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
