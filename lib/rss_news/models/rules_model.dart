import 'package:hive/hive.dart';

part 'rules_model.g.dart';

@HiveType(typeId: 0) // Ensure this typeId is unique within your app
class Rules extends HiveObject {
  @HiveField(0)
  String category; // Adblock or Immersive Reader

  @HiveField(1)
  String type; // Class or Id

  @HiveField(2)
  String value; // Class name or Id name

  @HiveField(3)
  String domain; // Website Domain

  // Constructor to initialize all fields
  Rules({
    required this.category,
    required this.type,
    required this.value,
    required this.domain,
  });

  // Named constructor to create a Rules object from a map
  factory Rules.fromMap(Map<String, dynamic> map) {
    return Rules(
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      value: map['value'] ?? '',
      domain: map['domain'] ?? '',
    );
  }

  // Method to convert a Rules object to a map
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'value': value,
      'domain': domain,
    };
  }

  // Override toString() to provide a custom string representation
  @override
  String toString() {
    return 'Rules(category: $category, type: $type, value: $value, domain: $domain)';
  }
}
