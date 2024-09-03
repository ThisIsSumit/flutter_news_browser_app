// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetFeedsVars> _$gGetFeedsVarsSerializer =
    new _$GGetFeedsVarsSerializer();

class _$GGetFeedsVarsSerializer implements StructuredSerializer<GGetFeedsVars> {
  @override
  final Iterable<Type> types = const [GGetFeedsVars, _$GGetFeedsVars];
  @override
  final String wireName = 'GGetFeedsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetFeedsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetFeedsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetFeedsVarsBuilder().build();
  }
}

class _$GGetFeedsVars extends GGetFeedsVars {
  factory _$GGetFeedsVars([void Function(GGetFeedsVarsBuilder)? updates]) =>
      (new GGetFeedsVarsBuilder()..update(updates))._build();

  _$GGetFeedsVars._() : super._();

  @override
  GGetFeedsVars rebuild(void Function(GGetFeedsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsVarsBuilder toBuilder() => new GGetFeedsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsVars;
  }

  @override
  int get hashCode {
    return 146632560;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetFeedsVars').toString();
  }
}

class GGetFeedsVarsBuilder
    implements Builder<GGetFeedsVars, GGetFeedsVarsBuilder> {
  _$GGetFeedsVars? _$v;

  GGetFeedsVarsBuilder();

  @override
  void replace(GGetFeedsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsVars;
  }

  @override
  void update(void Function(GGetFeedsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsVars build() => _build();

  _$GGetFeedsVars _build() {
    final _$result = _$v ?? new _$GGetFeedsVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
