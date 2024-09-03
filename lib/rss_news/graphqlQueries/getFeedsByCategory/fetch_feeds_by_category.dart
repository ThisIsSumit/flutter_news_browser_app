import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:flutter_browser/main.dart';
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart';
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.req.gql.dart';

class FetchFeedsByCategory {
  late Client client = Client(link: HttpLink(apiUrl), cache: Cache());

  Future<List<GGetFeedsByCategoryData_getFeeds>> byACategory(
      String category) async {
    // print(category);
    final request = GGetFeedsByCategoryReq((b) => b..vars.category = category);
    final response = await client.request(request).first;

    if (response.hasErrors) {
      throw Exception(response.linkException);
    }
    // print(response.data);
    return response.data?.getFeeds.toList() ?? [];
  }
}
