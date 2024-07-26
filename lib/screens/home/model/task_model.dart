class TaskModel {
  final int? id;
  final String title;
  final bool completed;
  final int? timestamp;

  TaskModel({
    this.id,
    required this.title,
    required this.completed,
    this.timestamp,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'completed': completed ? true : false,
      'timestamp': timestamp ?? DateTime.now().millisecondsSinceEpoch,
    };
  }
}
