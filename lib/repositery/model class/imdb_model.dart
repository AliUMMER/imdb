class Imdbmodel {
  int? rank;
  String? title;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? image;
  String? bigImage;
  String? description;
  String? trailer;
  String? trailerEmbedLink;
  String? trailerYoutubeId;
  List<String>? genre;
  List<String>? director;
  List<String>? writers;
  String? imdbid;
  String? imdbLink;

  Imdbmodel(
      {this.rank,
      this.title,
      this.thumbnail,
      this.rating,
      this.id,
      this.year,
      this.image,
      this.bigImage,
      this.description,
      this.trailer,
      this.trailerEmbedLink,
      this.trailerYoutubeId,
      this.genre,
      this.director,
      this.writers,
      this.imdbid,
      this.imdbLink});

  Imdbmodel.fromJson(Map<String, dynamic> json) {
    if (json["rank"] is int) {
      rank = json["rank"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["thumbnail"] is String) {
      thumbnail = json["thumbnail"];
    }
    if (json["rating"] is String) {
      rating = json["rating"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["year"] is int) {
      year = json["year"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["big_image"] is String) {
      bigImage = json["big_image"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["trailer"] is String) {
      trailer = json["trailer"];
    }
    if (json["trailer_embed_link"] is String) {
      trailerEmbedLink = json["trailer_embed_link"];
    }
    if (json["trailer_youtube_id"] is String) {
      trailerYoutubeId = json["trailer_youtube_id"];
    }
    if (json["genre"] is List) {
      genre = json["genre"] == null ? null : List<String>.from(json["genre"]);
    }
    if (json["director"] is List) {
      director =
          json["director"] == null ? null : List<String>.from(json["director"]);
    }
    if (json["writers"] is List) {
      writers =
          json["writers"] == null ? null : List<String>.from(json["writers"]);
    }
    if (json["imdbid"] is String) {
      imdbid = json["imdbid"];
    }
    if (json["imdb_link"] is String) {
      imdbLink = json["imdb_link"];
    }
  }

  static List<Imdbmodel> fromList(List<Map<String, dynamic>> list) {
    return list.map(Imdbmodel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rank"] = rank;
    _data["title"] = title;
    _data["thumbnail"] = thumbnail;
    _data["rating"] = rating;
    _data["id"] = id;
    _data["year"] = year;
    _data["image"] = image;
    _data["big_image"] = bigImage;
    _data["description"] = description;
    _data["trailer"] = trailer;
    _data["trailer_embed_link"] = trailerEmbedLink;
    _data["trailer_youtube_id"] = trailerYoutubeId;
    if (genre != null) {
      _data["genre"] = genre;
    }
    if (director != null) {
      _data["director"] = director;
    }
    if (writers != null) {
      _data["writers"] = writers;
    }
    _data["imdbid"] = imdbid;
    _data["imdb_link"] = imdbLink;
    return _data;
  }
}
