class PageAttributes {
  final String id;
  final String name;
  final String description;
  final int pageNumber;

  // Constructor
  PageAttributes({
    required this.id,
    required this.name,
    required this.description,
    required this.pageNumber,
  });

  // Factory constructor to create an instance from a Map
  factory PageAttributes.fromMap(Map<String, dynamic> map) {
    return PageAttributes(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      pageNumber: map['pageNumber'] as int,
    );
  }

  // Method to convert the instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pageNumber': pageNumber,
    };
  }
}
