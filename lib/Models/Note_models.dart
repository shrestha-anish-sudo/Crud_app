// Define a Note class representing a note entity
class Note {
  // Properties of the Note class
  int? id; 
  String? title; 
  DateTime? date;
  String? Priority;
  int? status; 

  // Constructor to create a new note
  Note({required this.title, this.date, this.Priority, this.status});

  // Constructor to create a note with a specified id
  Note.withId({
    required this.id,
    required this.title,
    this.date,
    this.Priority,
    this.status,
  });

  // Convert the Note object to a map (dictionary) of key-value pairs
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

  // Create a Note object from a map (dictionary) of key-value pairs
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
