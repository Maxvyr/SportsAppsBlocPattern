class Sport {
  String id;
  String name;
  String format;
  String thumb;
  String thumbGreen;
  String desc;

  Sport.fromJson(Map json)
      : id = json["idSport"],
        name = json["strSport"],
        format = json["strFormat"],
        thumb = json["strSportThumb"],
        thumbGreen = json["strSportThumbGreen"],
        desc = json["strSportDescription"];
}
