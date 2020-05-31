class Film {
  final String id;
  final String name; // Название фильма
  final String rating; //Возрастной рейтинг
  final String year; //Год выпуска
  final String genre; // Жанр
  final String caption; // Краткое описание фильма
  final String mainRoles; // Актерский состав
  final String director; // Cценарист и тд
  final String picUrl; // Ссылка на заглавную картинку фильма
  final String link; // Ссылка на сам фильм

  Film(
      {this.id,
      this.name,
      this.rating,
      this.year,
      this.genre,
      this.caption,
      this.mainRoles,
      this.director,
      this.picUrl,
      this.link});

  ///Преобразовывает фильм из json запроса в объект класса
  Film.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        rating = data['rating'],
        year = data['year'],
        genre = data['genre'],
        caption = data['caption'],
        mainRoles = data['mainRoles'],
        picUrl = data['picUrl'],
        director = data['director'],
        link = data['link'];
}
