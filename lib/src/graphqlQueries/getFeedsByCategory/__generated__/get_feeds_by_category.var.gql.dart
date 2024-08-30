// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i1;

part 'get_feeds_by_category.var.gql.g.dart';

abstract class GGetFeedsByCategoryVars
    implements Built<GGetFeedsByCategoryVars, GGetFeedsByCategoryVarsBuilder> {
  GGetFeedsByCategoryVars._();

  factory GGetFeedsByCategoryVars(
          [void Function(GGetFeedsByCategoryVarsBuilder b) updates]) =
      _$GGetFeedsByCategoryVars;

  String? get category;
  static Serializer<GGetFeedsByCategoryVars> get serializer =>
      _$gGetFeedsByCategoryVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsByCategoryVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsByCategoryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsByCategoryVars.serializer,
        json,
      );
}
