// import 'package:flutter/material.dart';
// import 'package:flutter_browser/rss_news/services/summeriz_article.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:xml/xml.dart' as xml;

// class BackgroundTask extends ChangeNotifier {
//   bool _isRunning = false;
//   SummarizeArticle summarizeArticle = SummarizeArticle();

//   bool get isRunning => _isRunning;

//   Future<void> getHighlights(
//       BuildContext context, List<String> feedUrls) async {
//     _isRunning = true;
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       notifyListeners();
//     });

//     try {
//       for (String url in feedUrls) {
//         await summarize(context, url);
//         await Future.delayed(const Duration(seconds: 2)); // Optional delay
//       }
//     } catch (e) {
//       debugPrint('Error occurred: $e');
//     } finally {
//       _isRunning = false;
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         notifyListeners();
//       });
//     }
//   }

//   Future<void> summarize(BuildContext context, String url) async {
//     try {
//       final box = Hive.box<List<String>>('preferences');
//       List<String> urlParts = url.split('*');
//       String originalUrl = urlParts.isNotEmpty ? urlParts[0] : url;
//       final response = await http.get(Uri.parse(originalUrl));
//       if (response.statusCode == 200) {
//         final decodedBody = utf8.decode(response.bodyBytes);

//         final document = xml.XmlDocument.parse(decodedBody);
//         final items = document.findAllElements('item');
//         for (var item in items) {
//           final linkElement = item.findElements('link').first;
//           final link = linkElement.text.trim();

//           String summary =
//               await summarizeArticle.summarizeArticle(context, link);
//           debugPrint(link);
//           if (box.get(link) == null) {
//             await box.put(
//                 link, summary.split(',').map((s) => s.trim()).toList());
//             debugPrint("Summary: $summary");
//           }
//           // else{
//           //   debugPrint("not ")
//           // }
//           await Future.delayed(const Duration(seconds: 3));
//         }
//       }
//     } catch (e) {
//       // Handle the exception
//       debugPrint("Error occurred while summarizing: $e");
//     }
//   }
// }
