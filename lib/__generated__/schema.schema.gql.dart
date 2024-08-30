// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i1;

part 'schema.schema.gql.g.dart';

abstract class GFeedFilterInput
    implements Built<GFeedFilterInput, GFeedFilterInputBuilder> {
  GFeedFilterInput._();

  factory GFeedFilterInput([void Function(GFeedFilterInputBuilder b) updates]) =
      _$GFeedFilterInput;

  int? get weight;
  String? get category;
  String? get source;
  String? get language;
  String? get feed_url;
  static Serializer<GFeedFilterInput> get serializer =>
      _$gFeedFilterInputSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GFeedFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GFeedFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GFeedFilterInput.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
