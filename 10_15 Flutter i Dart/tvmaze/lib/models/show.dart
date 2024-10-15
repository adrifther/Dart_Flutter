class Show{
  int id;
  String name;
  List<String>? genres;

  Show({required this.id, required this.name, required this.genres});
//contructor q no necesita declarar todas variables de clkasde)
  factory Show.fromJson(Map<String,dynamic> json){
    return Show(
      id: json["id"],
      name: json["name"],
      genres: List.from(json["genres"])
      );
  }
}