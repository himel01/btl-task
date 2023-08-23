import 'dart:convert';

List<ModelTask> taskModelFromJson(String str) => List<ModelTask>.from(
      json.decode(str).map(
            (x) => ModelTask.fromJson(x),
          ),
    );

class ModelTask {
  int userId;
  int id;
  String title;
  bool completed;

  ModelTask({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ModelTask.fromRawJson(String str) =>
      ModelTask.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelTask.fromJson(Map<String, dynamic> json) => ModelTask(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
