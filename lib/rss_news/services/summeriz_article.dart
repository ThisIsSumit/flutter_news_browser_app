// import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/utils/utils.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class SummarizeArticle {
  Future<String> summarizeArticle(String articleURL) async {
    try {
      final webContent = await Utils.extractAllParagraphsFromUrl(articleURL);
      // debugPrint("webcontent $webContent");
      const apiKey = 'AIzaSyAO2tECQTSKSX5y3JML8tk943P_tsNSl4c';

      final model = GenerativeModel(
        model: 'gemini-1.5-pro',
        apiKey: apiKey,
        safetySettings: [
          SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none)
        ],
      );

      final String prompt = 'Given the following article content, '
          ' generate 3 paras with a single para inside separeated by commas'
          ' as Key Players and Accusations, Key Facts and data , Key Arguments and Actions. '
          ' identify the exact parts in web contents and give those sentences or words separated by commas'
          'my main task for doing this is to highlight the text provided by you as is'
          'Ignore any non-relevant elements such as menus, promotions, and '
          'other unrelated information to the main article narrative $webContent'
          'give output as a single para without headings like **key players and Accusations';
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
