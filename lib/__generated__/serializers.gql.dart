// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:flutter_browser/__generated__/schema.schema.gql.dart'
    show GFeedFilterInput;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.data.gql.dart'
    show GGetFeedsData, GGetFeedsData_getFeeds;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.req.gql.dart'
    show GGetFeedsReq;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.var.gql.dart'
    show GGetFeedsVars;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart'
    show GGetFeedsByCategoryData, GGetFeedsByCategoryData_getFeeds;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.req.gql.dart'
    show GGetFeedsByCategoryReq;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.var.gql.dart'
    show GGetFeedsByCategoryVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GFeedFilterInput,
  GGetFeedsByCategoryData,
  GGetFeedsByCategoryData_getFeeds,
  GGetFeedsByCategoryReq,
  GGetFeedsByCategoryVars,
  GGetFeedsData,
  GGetFeedsData_getFeeds,
  GGetFeedsReq,
  GGetFeedsVars,
])
final Serializers serializers = _serializersBuilder.build();
