// feeds_service.dart
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:flutter_browser/main.dart';
import 'package:flutter_browser/src/graphqlQueries/getFeeds/__generated__/get_feed.data.gql.dart';
import 'package:flutter_browser/src/graphqlQueries/getFeeds/__generated__/get_feed.req.gql.dart';

class FetchFeeds {
  late Client client = Client(link: HttpLink(apiUrl), cache: Cache());
  Future<List<GGetFeedsData_getFeeds>> fetchFeeds() async {
    final request = GGetFeedsReq();
    final response = await client.request(request).first;

    if (response.hasErrors) {
      throw Exception(response.graphqlErrors!.first.message);
    }

    return response.data?.getFeeds.toList() ?? [];
  }

  Future<List<GGetFeedsData_getFeeds>> feedsBySelectedLanguage(
      List<String> languages) async {
    final feeds = await fetchFeeds();
    // debugPrint(feeds.first.toString());
    return feeds.where((feed) => languages.contains(feed.language)).toList();
  }
  Future<List<GGetFeedsData_getFeeds>> feedsBySelectedCategories(
      List<String> languages,
      List<String> categories) async {
    final feeds = await feedsBySelectedLanguage(languages);
    // debugPrint('feeds$feeds.');
    return feeds.where((feed) => categories.contains(feed.category)).toList();
  }
  Future<List<GGetFeedsData_getFeeds>> feedsBySelectedSource(
      List<String> languages,
      List<String> categories,List<String> sources) async {
    final feeds = await feedsBySelectedCategories(languages,categories);
    // debugPrint('feeds$feeds.');
    return feeds.where((feed) => sources.contains(feed.source)).toList();
  }

 }
