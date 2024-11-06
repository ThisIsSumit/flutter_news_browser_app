import 'dart:convert';

import 'package:ferry/ferry.dart';
import 'package:flutter_browser/rss_news/constants/constants.dart';
import 'package:flutter_browser/rss_news/models/feed_model.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart';
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.req.gql.dart';
import 'package:http/http.dart' as http;
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
   Future<List<Feed>> byAStaticCategory(String category) async {
  try {
    final response = await http.get(Uri.parse(staticApiUrl));
    
    if (response.statusCode == 200) {
      // Decode the response body
      final Map<String, dynamic> data = json.decode(response.body);
      
      if (data['feeds'] is List) {
        // Convert the JSON data to List<Feed> and filter by category
        final List<Feed> allFeeds = (data['feeds'] as List)
            .map((item) => Feed.fromJson(item as Map<String, dynamic>))
            .where((feed) => feed.category.toLowerCase() == category.toLowerCase())
            .toList();
            
        print('Fetched ${allFeeds.length} feeds for category: $category');
        return allFeeds;
      } else {
        throw Exception('Unexpected data format: "feeds" key is missing or not a list');
      }
    } else {
      throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching feeds by category: $e');
    throw Exception('Error fetching feeds by category: $e');
  }
}


}
