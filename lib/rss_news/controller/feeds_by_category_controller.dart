
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart';
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/fetch_feeds_by_category.dart';

class FeedsByCategoryController {
  late Future<List<GGetFeedsByCategoryData_getFeeds>> categoryFeeds;
  final FetchFeedsByCategory _byCategory = FetchFeedsByCategory();
  Future<List<GGetFeedsByCategoryData_getFeeds>> byACategory(String category) async {

    // converting the first characte for categories like delhi and Delhi
    String modifiedCategory = category.isNotEmpty
        ? (category[0].toUpperCase() == category[0]
        ? category[0].toLowerCase() + category.substring(1)
        : category[0].toUpperCase() + category.substring(1))
        : category;
    final originalFeeds = await _byCategory.byACategory(category);
    final modifiedFeeds = await _byCategory.byACategory(modifiedCategory);
    final combinedFeeds = {...originalFeeds, ...modifiedFeeds}.toList();
    // debugPrint('controller${feeds}');
    return combinedFeeds;
  }
}
