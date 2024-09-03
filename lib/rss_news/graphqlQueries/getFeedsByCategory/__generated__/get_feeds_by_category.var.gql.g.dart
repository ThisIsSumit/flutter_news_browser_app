// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feeds_by_category.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetFeedsByCategoryVars> _$gGetFeedsByCategoryVarsSerializer =
    new _$GGetFeedsByCategoryVarsSerializer();

class _$GGetFeedsByCategoryVarsSerializer
    implements StructuredSerializer<GGetFeedsByCategoryVars> {
  @override
  final Iterable<Type> types = const [
    GGetFeedsByCategoryVars,
    _$GGetFeedsByCategoryVars
  ];
  @override
  final String wireName = 'GGetFeedsByCategoryVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetFeedsByCategoryVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetFeedsByCategoryVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetFeedsByCategoryVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetFeedsByCategoryVars extends GGetFeedsByCategoryVars {
  @override
  final String? category;

  factory _$GGetFeedsByCategoryVars(
          [void Function(GGetFeedsByCategoryVarsBuilder)? updates]) =>
      (new GGetFeedsByCategoryVarsBuilder()..update(updates))._build();

  _$GGetFeedsByCategoryVars._({this.category}) : super._();

  @override
  GGetFeedsByCategoryVars rebuild(
          void Function(GGetFeedsByCategoryVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsByCategoryVarsBuilder toBuilder() =>
      new GGetFeedsByCategoryVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsByCategoryVars && category == other.category;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetFeedsByCategoryVars')
          ..add('category', category))
        .toString();
  }
}

class GGetFeedsByCategoryVarsBuilder
    implements
        Builder<GGetFeedsByCategoryVars, GGetFeedsByCategoryVarsBuilder> {
  _$GGetFeedsByCategoryVars? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  GGetFeedsByCategoryVarsBuilder();

  GGetFeedsByCategoryVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetFeedsByCategoryVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsByCategoryVars;
  }

  @override
  void update(void Function(GGetFeedsByCategoryVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsByCategoryVars build() => _build();

  _$GGetFeedsByCategoryVars _build() {
    final _$result = _$v ?? new _$GGetFeedsByCategoryVars._(category: category);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
