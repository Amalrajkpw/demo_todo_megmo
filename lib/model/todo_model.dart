class TodoModel {
  String title;

  String description;
  bool isCompleted;

  TodoModel({
    required this.title, required this.description, this.isCompleted = false,
  });
}

class TodoGetModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;


  TodoGetModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,

  });

  factory TodoGetModel.fromJson(Map<String, dynamic> json) {
    return TodoGetModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],

    );
  }
}