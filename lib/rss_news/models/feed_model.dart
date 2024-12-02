// First, create a Feed model class to properly represent your data
class Feed {
  final String id;
  final int weight;
  final String category;
  final String source;
  final String language;
  // ignore: non_constant_identifier_names
  final String feed_url;

  Feed({
    required this.id,
    required this.weight,
    required this.category,
    required this.source,
    required this.language,
    // ignore: non_constant_identifier_names
    required this.feed_url,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['_id'][r"$oid"] as String,
      weight: json['weight'] as int,
      category: json['category'] as String,
      source: json['source'] as String,
      language: json['language'] as String,
      feed_url: json['feed_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {r'$oid': id},
      'weight': weight,
      'category': category,
      'source': source,
      'language': language,
      'feed_url': feed_url,
    };
  }
}

// Updated fetch function

