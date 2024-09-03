// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetFeedsData> _$gGetFeedsDataSerializer =
    new _$GGetFeedsDataSerializer();
Serializer<GGetFeedsData_getFeeds> _$gGetFeedsDataGetFeedsSerializer =
    new _$GGetFeedsData_getFeedsSerializer();

class _$GGetFeedsDataSerializer implements StructuredSerializer<GGetFeedsData> {
  @override
  final Iterable<Type> types = const [GGetFeedsData, _$GGetFeedsData];
  @override
  final String wireName = 'GGetFeedsData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetFeedsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'getFeeds',
      serializers.serialize(object.getFeeds,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GGetFeedsData_getFeeds)])),
    ];

    return result;
  }

  @override
  GGetFeedsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetFeedsDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'getFeeds':
          result.getFeeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetFeedsData_getFeeds)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetFeedsData_getFeedsSerializer
    implements StructuredSerializer<GGetFeedsData_getFeeds> {
  @override
  final Iterable<Type> types = const [
    GGetFeedsData_getFeeds,
    _$GGetFeedsData_getFeeds
  ];
  @override
  final String wireName = 'GGetFeedsData_getFeeds';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetFeedsData_getFeeds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'weight',
      serializers.serialize(object.weight, specifiedType: const FullType(int)),
      'feed_url',
      serializers.serialize(object.feed_url,
          specifiedType: const FullType(String)),
      '_id',
      serializers.serialize(object.G_id, specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language,
          specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetFeedsData_getFeeds deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetFeedsData_getFeedsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'feed_url':
          result.feed_url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case '_id':
          result.G_id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetFeedsData extends GGetFeedsData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetFeedsData_getFeeds> getFeeds;

  factory _$GGetFeedsData([void Function(GGetFeedsDataBuilder)? updates]) =>
      (new GGetFeedsDataBuilder()..update(updates))._build();

  _$GGetFeedsData._({required this.G__typename, required this.getFeeds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetFeedsData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        getFeeds, r'GGetFeedsData', 'getFeeds');
  }

  @override
  GGetFeedsData rebuild(void Function(GGetFeedsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsDataBuilder toBuilder() => new GGetFeedsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsData &&
        G__typename == other.G__typename &&
        getFeeds == other.getFeeds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, getFeeds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetFeedsData')
          ..add('G__typename', G__typename)
          ..add('getFeeds', getFeeds))
        .toString();
  }
}

class GGetFeedsDataBuilder
    implements Builder<GGetFeedsData, GGetFeedsDataBuilder> {
  _$GGetFeedsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetFeedsData_getFeeds>? _getFeeds;
  ListBuilder<GGetFeedsData_getFeeds> get getFeeds =>
      _$this._getFeeds ??= new ListBuilder<GGetFeedsData_getFeeds>();
  set getFeeds(ListBuilder<GGetFeedsData_getFeeds>? getFeeds) =>
      _$this._getFeeds = getFeeds;

  GGetFeedsDataBuilder() {
    GGetFeedsData._initializeBuilder(this);
  }

  GGetFeedsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getFeeds = $v.getFeeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetFeedsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsData;
  }

  @override
  void update(void Function(GGetFeedsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsData build() => _build();

  _$GGetFeedsData _build() {
    _$GGetFeedsData _$result;
    try {
      _$result = _$v ??
          new _$GGetFeedsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetFeedsData', 'G__typename'),
              getFeeds: getFeeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getFeeds';
        getFeeds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetFeedsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetFeedsData_getFeeds extends GGetFeedsData_getFeeds {
  @override
  final String G__typename;
  @override
  final int weight;
  @override
  final String feed_url;
  @override
  final String G_id;
  @override
  final String language;
  @override
  final String category;
  @override
  final String source;

  factory _$GGetFeedsData_getFeeds(
          [void Function(GGetFeedsData_getFeedsBuilder)? updates]) =>
      (new GGetFeedsData_getFeedsBuilder()..update(updates))._build();

  _$GGetFeedsData_getFeeds._(
      {required this.G__typename,
      required this.weight,
      required this.feed_url,
      required this.G_id,
      required this.language,
      required this.category,
      required this.source})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetFeedsData_getFeeds', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        weight, r'GGetFeedsData_getFeeds', 'weight');
    BuiltValueNullFieldError.checkNotNull(
        feed_url, r'GGetFeedsData_getFeeds', 'feed_url');
    BuiltValueNullFieldError.checkNotNull(
        G_id, r'GGetFeedsData_getFeeds', 'G_id');
    BuiltValueNullFieldError.checkNotNull(
        language, r'GGetFeedsData_getFeeds', 'language');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GGetFeedsData_getFeeds', 'category');
    BuiltValueNullFieldError.checkNotNull(
        source, r'GGetFeedsData_getFeeds', 'source');
  }

  @override
  GGetFeedsData_getFeeds rebuild(
          void Function(GGetFeedsData_getFeedsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsData_getFeedsBuilder toBuilder() =>
      new GGetFeedsData_getFeedsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsData_getFeeds &&
        G__typename == other.G__typename &&
        weight == other.weight &&
        feed_url == other.feed_url &&
        G_id == other.G_id &&
        language == other.language &&
        category == other.category &&
        source == other.source;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, feed_url.hashCode);
    _$hash = $jc(_$hash, G_id.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetFeedsData_getFeeds')
          ..add('G__typename', G__typename)
          ..add('weight', weight)
          ..add('feed_url', feed_url)
          ..add('G_id', G_id)
          ..add('language', language)
          ..add('category', category)
          ..add('source', source))
        .toString();
  }
}

class GGetFeedsData_getFeedsBuilder
    implements Builder<GGetFeedsData_getFeeds, GGetFeedsData_getFeedsBuilder> {
  _$GGetFeedsData_getFeeds? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  String? _feed_url;
  String? get feed_url => _$this._feed_url;
  set feed_url(String? feed_url) => _$this._feed_url = feed_url;

  String? _G_id;
  String? get G_id => _$this._G_id;
  set G_id(String? G_id) => _$this._G_id = G_id;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  GGetFeedsData_getFeedsBuilder() {
    GGetFeedsData_getFeeds._initializeBuilder(this);
  }

  GGetFeedsData_getFeedsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _weight = $v.weight;
      _feed_url = $v.feed_url;
      _G_id = $v.G_id;
      _language = $v.language;
      _category = $v.category;
      _source = $v.source;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetFeedsData_getFeeds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsData_getFeeds;
  }

  @override
  void update(void Function(GGetFeedsData_getFeedsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsData_getFeeds build() => _build();

  _$GGetFeedsData_getFeeds _build() {
    final _$result = _$v ??
        new _$GGetFeedsData_getFeeds._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GGetFeedsData_getFeeds', 'G__typename'),
            weight: BuiltValueNullFieldError.checkNotNull(
                weight, r'GGetFeedsData_getFeeds', 'weight'),
            feed_url: BuiltValueNullFieldError.checkNotNull(
                feed_url, r'GGetFeedsData_getFeeds', 'feed_url'),
            G_id: BuiltValueNullFieldError.checkNotNull(
                G_id, r'GGetFeedsData_getFeeds', 'G_id'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'GGetFeedsData_getFeeds', 'language'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'GGetFeedsData_getFeeds', 'category'),
            source: BuiltValueNullFieldError.checkNotNull(
                source, r'GGetFeedsData_getFeeds', 'source'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
