class Todo{
  int userId;
  int id;
  String title;
  bool completed;

  Todo({required this.userId, required this.id, required this.title, required this.completed});

  //para pasar de JSON, y constructor que no requiere todos las variables de la clase.
  factory Todo.fromJson(Map<String,dynamic>json){
    return Todo(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"]);
  }
}