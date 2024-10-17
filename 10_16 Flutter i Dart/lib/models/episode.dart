class Episode{
  int id;
  String name;
  String? summary; //string puede ser null, no sera required

  Episode({required this.id,required this.name,this.summary});

  factory Episode.fromJson(Map<String,dynamic> json){
    return Episode(
    id: json["id"],
    name: json["name"],
    summary: json["summary"]
    );
  }

}