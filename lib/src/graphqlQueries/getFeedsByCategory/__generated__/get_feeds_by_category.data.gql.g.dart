// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feeds_by_category.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetFeedsByCategoryData> _$gGetFeedsByCategoryDataSerializer =
    new _$GGetFeedsByCategoryDataSerializer();
Serializer<GGetFeedsByCategoryData_getFeeds>
    _$gGetFeedsByCategoryDataGetFeedsSerializer =
    new _$GGetFeedsByCategoryData_getFeedsSerializer();

class _$GGetFeedsByCategoryDataSerializer
    implements StructuredSerializer<GGetFeedsByCategoryData> {
  @override
  final Iterable<Type> types = const [
    GGetFeedsByCategoryData,
    _$GGetFeedsByCategoryData
  ];
  @override
  final String wireName = 'GGetFeedsByCategoryData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetFeedsByCategoryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'getFeeds',
      serializers.serialize(object.getFeeds,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GGetFeedsByCategoryData_getFeeds)])),
    ];

    return result;
  }

  @override
  GGetFeedsByCategoryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetFeedsByCategoryDataBuilder();

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
                const FullType(GGetFeedsByCategoryData_getFeeds)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetFeedsByCategoryData_getFeedsSerializer
    implements StructuredSerializer<GGetFeedsByCategoryData_getFeeds> {
  @override
  final Iterable<Type> types = const [
    GGetFeedsByCategoryData_getFeeds,
    _$GGetFeedsByCategoryData_getFeeds
  ];
  @override
  final String wireName = 'GGetFeedsByCategoryData_getFeeds';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetFeedsByCategoryData_getFeeds object,
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
  GGetFeedsByCategoryData_getFeeds deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetFeedsByCategoryData_getFeedsBuilder();

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

class _$GGetFeedsByCategoryData extends GGetFeedsByCategoryData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetFeedsByCategoryData_getFeeds> getFeeds;

  factory _$GGetFeedsByCategoryData(
          [void Function(GGetFeedsByCategoryDataBuilder)? updates]) =>
      (new GGetFeedsByCategoryDataBuilder()..update(updates))._build();

  _$GGetFeedsByCategoryData._(
      {required this.G__typename, required this.getFeeds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetFeedsByCategoryData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        getFeeds, r'GGetFeedsByCategoryData', 'getFeeds');
  }

  @override
  GGetFeedsByCategoryData rebuild(
          void Function(GGetFeedsByCategoryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsByCategoryDataBuilder toBuilder() =>
      new GGetFeedsByCategoryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsByCategoryData &&
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
    return (newBuiltValueToStringHelper(r'GGetFeedsByCategoryData')
          ..add('G__typename', G__typename)
          ..add('getFeeds', getFeeds))
        .toString();
  }
}

class GGetFeedsByCategoryDataBuilder
    implements
        Builder<GGetFeedsByCategoryData, GGetFeedsByCategoryDataBuilder> {
  _$GGetFeedsByCategoryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetFeedsByCategoryData_getFeeds>? _getFeeds;
  ListBuilder<GGetFeedsByCategoryData_getFeeds> get getFeeds =>
      _$this._getFeeds ??= new ListBuilder<GGetFeedsByCategoryData_getFeeds>();
  set getFeeds(ListBuilder<GGetFeedsByCategoryData_getFeeds>? getFeeds) =>
      _$this._getFeeds = getFeeds;

  GGetFeedsByCategoryDataBuilder() {
    GGetFeedsByCategoryData._initializeBuilder(this);
  }

  GGetFeedsByCategoryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _getFeeds = $v.getFeeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetFeedsByCategoryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsByCategoryData;
  }

  @override
  void update(void Function(GGetFeedsByCategoryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsByCategoryData build() => _build();

  _$GGetFeedsByCategoryData _build() {
    _$GGetFeedsByCategoryData _$result;
    try {
      _$result = _$v ??
          new _$GGetFeedsByCategoryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetFeedsByCategoryData', 'G__typename'),
              getFeeds: getFeeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'getFeeds';
        getFeeds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetFeedsByCategoryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetFeedsByCategoryData_getFeeds
    extends GGetFeedsByCategoryData_getFeeds {
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

  factory _$GGetFeedsByCategoryData_getFeeds(
          [void Function(GGetFeedsByCategoryData_getFeedsBuilder)? updates]) =>
      (new GGetFeedsByCategoryData_getFeedsBuilder()..update(updates))._build();

  _$GGetFeedsByCategoryData_getFeeds._(
      {required this.G__typename,
      required this.weight,
      required this.feed_url,
      required this.G_id,
      required this.language,
      required this.category,
      required this.source})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetFeedsByCategoryData_getFeeds', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        weight, r'GGetFeedsByCategoryData_getFeeds', 'weight');
    BuiltValueNullFieldError.checkNotNull(
        feed_url, r'GGetFeedsByCategoryData_getFeeds', 'feed_url');
    BuiltValueNullFieldError.checkNotNull(
        G_id, r'GGetFeedsByCategoryData_getFeeds', 'G_id');
    BuiltValueNullFieldError.checkNotNull(
        language, r'GGetFeedsByCategoryData_getFeeds', 'language');
    BuiltValueNullFieldError.checkNotNull(
        category, r'GGetFeedsByCategoryData_getFeeds', 'category');
    BuiltValueNullFieldError.checkNotNull(
        source, r'GGetFeedsByCategoryData_getFeeds', 'source');
  }

  @override
  GGetFeedsByCategoryData_getFeeds rebuild(
          void Function(GGetFeedsByCategoryData_getFeedsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetFeedsByCategoryData_getFeedsBuilder toBuilder() =>
      new GGetFeedsByCategoryData_getFeedsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetFeedsByCategoryData_getFeeds &&
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
    return (newBuiltValueToStringHelper(r'GGetFeedsByCategoryData_getFeeds')
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

class GGetFeedsByCategoryData_getFeedsBuilder
    implements
        Builder<GGetFeedsByCategoryData_getFeeds,
            GGetFeedsByCategoryData_getFeedsBuilder> {
  _$GGetFeedsByCategoryData_getFeeds? _$v;

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

  GGetFeedsByCategoryData_getFeedsBuilder() {
    GGetFeedsByCategoryData_getFeeds._initializeBuilder(this);
  }

  GGetFeedsByCategoryData_getFeedsBuilder get _$this {
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
  void replace(GGetFeedsByCategoryData_getFeeds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetFeedsByCategoryData_getFeeds;
  }

  @override
  void update(void Function(GGetFeedsByCategoryData_getFeedsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetFeedsByCategoryData_getFeeds build() => _build();

  _$GGetFeedsByCategoryData_getFeeds _build() {
    final _$result = _$v ??
        new _$GGetFeedsByCategoryData_getFeeds._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetFeedsByCategoryData_getFeeds', 'G__typename'),
            weight: BuiltValueNullFieldError.checkNotNull(
                weight, r'GGetFeedsByCategoryData_getFeeds', 'weight'),
            feed_url: BuiltValueNullFieldError.checkNotNull(
                feed_url, r'GGetFeedsByCategoryData_getFeeds', 'feed_url'),
            G_id: BuiltValueNullFieldError.checkNotNull(
                G_id, r'GGetFeedsByCategoryData_getFeeds', 'G_id'),
            language: BuiltValueNullFieldError.checkNotNull(
                language, r'GGetFeedsByCategoryData_getFeeds', 'language'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'GGetFeedsByCategoryData_getFeeds', 'category'),
            source: BuiltValueNullFieldError.checkNotNull(
                source, r'GGetFeedsByCategoryData_getFeeds', 'source'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
