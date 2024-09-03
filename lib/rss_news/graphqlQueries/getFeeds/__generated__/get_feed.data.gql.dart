// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i1;

part 'get_feed.data.gql.g.dart';

abstract class GGetFeedsData
    implements Built<GGetFeedsData, GGetFeedsDataBuilder> {
  GGetFeedsData._();

  factory GGetFeedsData([void Function(GGetFeedsDataBuilder b) updates]) =
      _$GGetFeedsData;

  static void _initializeBuilder(GGetFeedsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetFeedsData_getFeeds> get getFeeds;
  static Serializer<GGetFeedsData> get serializer => _$gGetFeedsDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsData.serializer,
        json,
      );
}

abstract class GGetFeedsData_getFeeds
    implements Built<GGetFeedsData_getFeeds, GGetFeedsData_getFeedsBuilder> {
  GGetFeedsData_getFeeds._();

  factory GGetFeedsData_getFeeds(
          [void Function(GGetFeedsData_getFeedsBuilder b) updates]) =
      _$GGetFeedsData_getFeeds;

  static void _initializeBuilder(GGetFeedsData_getFeedsBuilder b) =>
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
  static Serializer<GGetFeedsData_getFeeds> get serializer =>
      _$gGetFeedsDataGetFeedsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsData_getFeeds.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsData_getFeeds? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsData_getFeeds.serializer,
        json,
      );
}
