// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFeedFilterInput> _$gFeedFilterInputSerializer =
    new _$GFeedFilterInputSerializer();

class _$GFeedFilterInputSerializer
    implements StructuredSerializer<GFeedFilterInput> {
  @override
  final Iterable<Type> types = const [GFeedFilterInput, _$GFeedFilterInput];
  @override
  final String wireName = 'GFeedFilterInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFeedFilterInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.source;
    if (value != null) {
      result
        ..add('source')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.feed_url;
    if (value != null) {
      result
        ..add('feed_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFeedFilterInput deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFeedFilterInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'feed_url':
          result.feed_url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GFeedFilterInput extends GFeedFilterInput {
  @override
  final int? weight;
  @override
  final String? category;
  @override
  final String? source;
  @override
  final String? language;
  @override
  final String? feed_url;

  factory _$GFeedFilterInput(
          [void Function(GFeedFilterInputBuilder)? updates]) =>
      (new GFeedFilterInputBuilder()..update(updates))._build();

  _$GFeedFilterInput._(
      {this.weight, this.category, this.source, this.language, this.feed_url})
      : super._();

  @override
  GFeedFilterInput rebuild(void Function(GFeedFilterInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFeedFilterInputBuilder toBuilder() =>
      new GFeedFilterInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFeedFilterInput &&
        weight == other.weight &&
        category == other.category &&
        source == other.source &&
        language == other.language &&
        feed_url == other.feed_url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, feed_url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFeedFilterInput')
          ..add('weight', weight)
          ..add('category', category)
          ..add('source', source)
          ..add('language', language)
          ..add('feed_url', feed_url))
        .toString();
  }
}

class GFeedFilterInputBuilder
    implements Builder<GFeedFilterInput, GFeedFilterInputBuilder> {
  _$GFeedFilterInput? _$v;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _feed_url;
  String? get feed_url => _$this._feed_url;
  set feed_url(String? feed_url) => _$this._feed_url = feed_url;

  GFeedFilterInputBuilder();

  GFeedFilterInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _weight = $v.weight;
      _category = $v.category;
      _source = $v.source;
      _language = $v.language;
      _feed_url = $v.feed_url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFeedFilterInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFeedFilterInput;
  }

  @override
  void update(void Function(GFeedFilterInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFeedFilterInput build() => _build();

  _$GFeedFilterInput _build() {
    final _$result = _$v ??
        new _$GFeedFilterInput._(
            weight: weight,
            category: category,
            source: source,
            language: language,
            feed_url: feed_url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
