import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/constants/constants.dart';
import 'package:flutter_browser/rss_news/widgets/rss_feeds.dart';

import '../graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart';

class CustomCategoryFeeds extends StatefulWidget {
  final List<GGetFeedsByCategoryData_getFeeds> feedsByACategory;
  const CustomCategoryFeeds({Key? key, required this.feedsByACategory});

  @override
  State<CustomCategoryFeeds> createState() => _CustomCategoryFeedsState();
}

class _CustomCategoryFeedsState extends State<CustomCategoryFeeds> {
  List<String> feedUrls = [];
  bool isLoading = true;

  Future<void> _populateFeedUrls() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<GGetFeedsByCategoryData_getFeeds> feeds =
          widget.feedsByACategory;
      setState(() {
        feedUrls =
            feeds.map((feed) => '${feed.feed_url}*${feed.source}').toList();
      });
    } catch (e) {
      print('Error populating feedUrls: $e');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // debugPrint('init state of custom category feeds');
    super.initState();
    _populateFeedUrls();
  }

  @override
  void didUpdateWidget(CustomCategoryFeeds oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.feedsByACategory != oldWidget.feedsByACategory) {
      _populateFeedUrls();
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('c${feedUrls.toString()}');
    return isLoading
        ? const Loader()
        : RSSFeedScreen(
            feedUrls: feedUrls,
          );
  }
}
