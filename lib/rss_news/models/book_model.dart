class Book {
  String? id;
  String? classNumber;
  String? subject;
  String? board;

  Book({
    this.id,
    this.classNumber,
    this.subject,
    this.board,
  });

  Book copyWith({
    String? id,
    String? classNumber,
    String? subject,
    String? board,
  }) =>
      Book(
        id: id ?? this.id,
        classNumber: classNumber ?? this.classNumber,
        subject: subject ?? this.subject,
        board: board ?? this.board,
      );

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json["id"],
        classNumber: json["class"],
        subject: json["subject"],
        board: json["board"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "class": classNumber,
        "subject": subject,
        "board": board,
      };

  @override
  String toString() {
    return 'Book('
        'id: $id, '
        'class: $classNumber, '
        'subject: $subject, '
        'board: $board'
        ')';
  }
}
