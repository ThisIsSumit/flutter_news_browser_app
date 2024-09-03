// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:flutter_browser/__generated__/serializers.gql.dart' as _i6;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.ast.gql.dart'
    as _i5;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.data.gql.dart'
    as _i2;
import 'package:flutter_browser/rss_news/graphqlQueries/getFeeds/__generated__/get_feed.var.gql.dart'
    as _i3;

part 'get_feed.req.gql.g.dart';

abstract class GGetFeedsReq
    implements
        Built<GGetFeedsReq, GGetFeedsReqBuilder>,
        _i1.OperationRequest<_i2.GGetFeedsData, _i3.GGetFeedsVars> {
  GGetFeedsReq._();

  factory GGetFeedsReq([void Function(GGetFeedsReqBuilder b) updates]) =
      _$GGetFeedsReq;

  static void _initializeBuilder(GGetFeedsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetFeeds',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetFeedsVars get vars;
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
  _i2.GGetFeedsData? Function(
    _i2.GGetFeedsData?,
    _i2.GGetFeedsData?,
  )? get updateResult;
  @override
  _i2.GGetFeedsData? get optimisticResponse;
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
  _i2.GGetFeedsData? parseData(Map<String, dynamic> json) =>
      _i2.GGetFeedsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetFeedsData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetFeedsData, _i3.GGetFeedsVars> transformOperation(
          _i4.Operation Function(_i4.Operation) transform) =>
      this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GGetFeedsReq> get serializer => _$gGetFeedsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetFeedsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetFeedsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetFeedsReq.serializer,
        json,
      );
}
