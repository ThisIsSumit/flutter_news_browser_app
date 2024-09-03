// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i1;

part 'get_feed.var.gql.g.dart';

abstract class GGetFeedsVars
    implements Built<GGetFeedsVars, GGetFeedsVarsBuilder> {
  GGetFeedsVars._();

  factory GGetFeedsVars([void Function(GGetFeedsVarsBuilder b) updates]) =
      _$GGetFeedsVars;

  static Serializer<GGetFeedsVars> get serializer => _$gGetFeedsVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetFeedsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetFeedsVars.serializer,
        json,
      );
}
