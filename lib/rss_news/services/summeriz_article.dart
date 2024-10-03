// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_browser/models/browser_model.dart';
import 'package:flutter_browser/rss_news/utils/utils.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class SummarizeArticle {
  Future<bool> validateApiKey(String apiKey) async {
    final response = await http.get(
      Uri.parse('https://api.yourservice.com/validate_key'), // Replace with the actual validation endpoint
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      // Key is valid
      return true;
    } else {
      // Handle the case where the key is invalid
      debugPrint('Invalid API key: ${response.body}');
      return false;
    }
  }
  Future<String> summarizeArticle(
      BuildContext context, String articleURL) async {
    try {
      final webContent = await Utils.extractAllParagraphsFromUrl(articleURL);
      // debugPrint("webcontent $webContent");
      var browserModel = Provider.of<BrowserModel>(context, listen: false);
      var settings = browserModel.getSettings();
      String apiKey = settings.geminiApiKey;
      debugPrint("helloWorld");
      debugPrint("apiKey " + apiKey);
      // const apiKey = 'AIzaSyAO2tECQTSKSX5y3JML8tk943P_tsNSl4c';
      final model = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: apiKey,
        safetySettings: [
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none)
        ],
      );

      final String prompt = 'Given the following article content, '
          ' generate 3 separate parts'
          ' as Key Players and Accusations, Key Facts and data , Key Arguments and Actions. '
          ' identify the exact parts in web contents and give those sentences or words separated by commas'
          'my main task for doing this is to highlight the text provided by you as is'
          'Ignore any non-relevant elements such as menus, promotions, and '
          'other unrelated information to the main article narrative $webContent'
          'give output as a single para without phrases  like Key Players and Accusations, Key Facts and data , Key Arguments and Actions';
      final content = [Content.text(prompt)];

      final response = await model.generateContent(content);
      if (response.text != null) {
        return response.text!;
      }
      // return "No response";
      throw Exception('response text is null');
    } catch (error) {
      throw Exception('failed to summarize ${error.toString()}');
    }
  }
}
