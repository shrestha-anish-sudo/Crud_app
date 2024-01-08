class Note {
  int? id;
  String? title;
  DateTime? date;
  String? Priority;
  int? status;

  Note({required this.title, this.date, this.Priority, this.status});

  Note.withId(
      {required this.id,
      required this.title,
      this.date,
      this.Priority,
      this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date!.toIso8601String();
    map['Priority'] = Priority;
    map['status'] = status;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      Priority: map['Priority'],
      status: map['status'],
    );
  }
}
