// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i6;
import 'package:flutter_browser/src/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.ast.gql.dart'
    as _i5;
import 'package:flutter_browser/src/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.data.gql.dart'
    as _i2;
import 'package:flutter_browser/src/graphqlQueries/getFeedsByCategory/__generated__/get_feeds_by_category.var.gql.dart'
    as _i3;

part 'get_feeds_by_category.req.gql.g.dart';

abstract class GGetFeedsByCategoryReq
    implements
        Built<GGetFeedsByCategoryReq, GGetFeedsByCategoryReqBuilder>,
        _i1.OperationRequest<_i2.GGetFeedsByCategoryData,
            _i3.GGetFeedsByCategoryVars> {
  GGetFeedsByCategoryReq._();

  factory GGetFeedsByCategoryReq(
          [void Function(GGetFeedsByCategoryReqBuilder b) updates]) =
      _$GGetFeedsByCategoryReq;

  static void _initializeBuilder(GGetFeedsByCategoryReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetFeedsByCategory',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetFeedsByCategoryVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetFeedsByCategoryData? Function(
    _i2.GGetFeedsByCategoryData?,
    _i2.GGetFeedsByCategoryData?,
  )? get updateResult;
  @override
  _i2.GGetFeedsByCategoryData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GGetFeedsByCategoryData? parseData(Map<String, dynamic> json) =>
      _i2.GGetFeedsByCategoryData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetFeedsByCategoryData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetFeedsByCategoryData, _i3.GGetFeedsByCategoryVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GGetFeedsByCategoryReq> get serializer =>
      _$gGetFeedsByCategoryReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetFeedsByCategoryReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsByCategoryReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetFeedsByCategoryReq.serializer,
        json,
      );
}
