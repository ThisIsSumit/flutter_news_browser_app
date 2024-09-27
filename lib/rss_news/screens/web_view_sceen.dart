import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/summeriz_article.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  const NewsWebView({
    Key? key,
    required this.url,
  });
  
  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late WebViewController _controller;
  SummarizeArticle summarizeArticle = SummarizeArticle();
  String summary = "";
  bool _hasSummarized = false; // Flag to prevent multiple summarizations

  Future<List<String>> summarize() async {
    try {
      _hasSummarized = true;
      summary = await summarizeArticle.summarizeArticle(context, widget.url);
      final box = Hive.box<List<String>>('preferences');
      await box.put(
          'summary', summary.split(',').map((s) => s.trim()).toList());
    } catch (e) {
      debugPrint("Error summarizing article: $e");
    }

    debugPrint("Summary $summary");
    return summary.split(',').map((s) => s.trim()).toList();
  }

  Future<String> loadLocalJs() async {
    return await rootBundle.loadString('assets/js/custom.js');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (url) async {
          if (!_hasSummarized) {
            List<String> listSummary = await summarize();
            String jsCode = await loadLocalJs();
            // Inject the list of strings to highlight into the JavaScript code
            String finalJsCode = """
                window.textToHighlightList = ${listSummary.map((e) => "'${e.replaceAll("'", "\\'")}'").toList()};
                $jsCode
              """;
            _controller.runJavascript(finalJsCode);
          }
        },
      ),
    );
  }

  
}
