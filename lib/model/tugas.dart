class Tugas {
  int? id;
  String? title;
  String? description;
  DateTime? deadline;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tugas({
    this.id,
    this.title,
    this.description,
    this.deadline,
    this.createdAt,
    this.updatedAt,
  });

  factory Tugas.fromJson(Map<String, dynamic> obj) {
    return Tugas(
      id: obj['id'],
      title: obj['title'],
      description: obj['description'],
      deadline: obj['due_date'] != null ? DateTime.parse(obj['due_date']) : null,
      createdAt: obj['created_at'] != null ? DateTime.parse(obj['created_at']) : null,
      updatedAt: obj['updated_at'] != null ? DateTime.parse(obj['updated_at']) : null,
    );
  }
}
