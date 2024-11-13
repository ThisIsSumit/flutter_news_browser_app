import 'package:flutter/material.dart';

enum Language {
  // ignore: constant_identifier_names
  English,
  // ignore: constant_identifier_names
  Hindi,
  // ignore: constant_identifier_names
  Telugu
}

const apiUrl = "https://dev-api-news-rss-sr235aqw.pragament.com/graphql";
const staticApiUrl ="https://staticapis.pragament.com/rss_news/rss_feeds.json";

class Loader extends StatelessWidget {
  const Loader({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
