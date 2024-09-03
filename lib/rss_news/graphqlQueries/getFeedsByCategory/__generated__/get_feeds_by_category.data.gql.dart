// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i1;

part 'get_feeds_by_category.data.gql.g.dart';

abstract class GGetFeedsByCategoryData
    implements Built<GGetFeedsByCategoryData, GGetFeedsByCategoryDataBuilder> {
  GGetFeedsByCategoryData._();

  factory GGetFeedsByCategoryData(
          [void Function(GGetFeedsByCategoryDataBuilder b) updates]) =
      _$GGetFeedsByCategoryData;

  static void _initializeBuilder(GGetFeedsByCategoryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetFeedsByCategoryData_getFeeds> get getFeeds;
  static Serializer<GGetFeedsByCategoryData> get serializer =>
      _$gGetFeedsByCategoryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsByCategoryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsByCategoryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsByCategoryData.serializer,
        json,
      );
}

abstract class GGetFeedsByCategoryData_getFeeds
    implements
        Built<GGetFeedsByCategoryData_getFeeds,
            GGetFeedsByCategoryData_getFeedsBuilder> {
  GGetFeedsByCategoryData_getFeeds._();

  factory GGetFeedsByCategoryData_getFeeds(
          [void Function(GGetFeedsByCategoryData_getFeedsBuilder b) updates]) =
      _$GGetFeedsByCategoryData_getFeeds;

  static void _initializeBuilder(GGetFeedsByCategoryData_getFeedsBuilder b) =>
      b..G__typename = 'Feed';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get weight;
  String get feed_url;
  @BuiltValueField(wireName: '_id')
  String get G_id;
  String get language;
  String get category;
  String get source;
  static Serializer<GGetFeedsByCategoryData_getFeeds> get serializer =>
      _$gGetFeedsByCategoryDataGetFeedsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsByCategoryData_getFeeds.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsByCategoryData_getFeeds? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsByCategoryData_getFeeds.serializer,
        json,
      );
}
