import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/grpahql/graphql_raw.dart';
import 'package:flutter_browser/rss_news/grpahql/graphql_services.dart';
import 'package:flutter_browser/rss_news/models/device_model.dart';
import 'package:flutter_browser/rss_news/models/feed_model.dart';
import 'package:flutter_browser/rss_news/utils/show_snackbar.dart';

class GraphQLRequests {
  GraphQLRequests();

  Future<List<Feed>?> getFeeds() async {
    final response =
        await GraphQLService().performQuery(GraphQLRaw.getFeeds, variables: {});

    if (response.hasException) {
      debugPrint('GraphQL Error: ${response.exception}');
      return null;
    }

    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('getFeeds')
        ? (data['getFeeds'] as List<dynamic>)
            .map((e) => Feed.fromJson(e as Map<String, dynamic>))
            .toList()
        : null;
  }

  Future<Map<String, dynamic>?> createDevice(Device device) async {
    final response = await GraphQLService()
        .performMutation(GraphQLRaw.createDevice, variables: {
      'id': device.deviceId,
      'name': device.deviceName,
      'gid': device.groupId,
      'pid': device.profileId
    });

    if (response.hasException) {
      showSnackBar(message: response.exception!.raw![0]["message"].toString());
      return null;
    } else {
      showSnackBar(message: "device registerd succesfully");
    }
    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('createDevice')
        ? data['createDevice'] as Map<String, dynamic>
        : null;
  }

  Future<Map<String, dynamic>?> updateDevice(Device device) async {
    final response = await GraphQLService()
        .performMutation(GraphQLRaw.updateDevice, variables: {
      'id': device.id,
      'name': device.deviceName,
    });

    if (response.hasException) {
      showSnackBar(message: response.exception!.toString());
      return null;
    }

    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('updateDevice')
        ? data['updateDevice'] as Map<String, dynamic>
        : null;
  }

  Future<Map<String, dynamic>?> getDeviceById(String id) async {
    final response = await GraphQLService()
        .performQuery(GraphQLRaw.getDeviceById, variables: {
      'id': id,
    });

    if (response.hasException) {
      showSnackBar(message: response.exception!.toString());
      return null;
    }

    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('getDeviceById')
        ? data['getDeviceById'] as Map<String, dynamic>
        : null;
  }

  Future<Map<String, dynamic>?> pushLog(
      String domain, String pageUrl, String deviceId, String category) async {
    final response =
        await GraphQLService().performQuery(GraphQLRaw.pushLog, variables: {
      'domain': domain,
      'page_url': pageUrl,
      'device_id': deviceId,
      'category': category,
    });

    if (response.hasException) {
      showSnackBar(message: response.exception!.toString());
      return null;
    }

    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('pushLog')
        ? data['pushLog'] as Map<String, dynamic>
        : null;
  }

  Future<List<Object?>> childsActivities(String deviceId) async {
    final response = await GraphQLService().performQuery(
      GraphQLRaw.childsActivities,
      variables: {
        'deviceId': deviceId,
      },
    );

    if (response.hasException) {
      showSnackBar(message: response.exception!.toString());
      return [];
    }

    final Map<String, dynamic>? data = response.data;

    return data != null && data.containsKey('getAllWebsiteUsageLogs')
        ? data['getAllWebsiteUsageLogs'] as List<Object?>
        : [];
  }
}
