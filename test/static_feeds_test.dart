import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/fetch_feeds_by_category.dart';
// import 'package:flutter_browser/rss_news/services/fetch_static_fields.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Fetch static feeds test', () async {
    // StaticFeeds staticFeeds = StaticFeeds();
    // await staticFeeds.fetchStaticFeeds();
    FetchFeedsByCategory s = FetchFeedsByCategory();
    await s.byAStaticCategory("international");
    // Add assertions as needed
  });
}
