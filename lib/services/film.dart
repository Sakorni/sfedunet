class Film {
  final String id;
  final String name; // Название фильма
  final String rating; //Возрастной рейтинг
  final String year; //Год выпуска
  final String genre; // Жанр
  final String caption; // Краткое описание фильма
  final String info; // Актерский состав, сценаристы и тд
  final String picUrl; // Ссылка на заглавную картинку фильма
  final String link; // Ссылка на сам фильм

  Film(
      {this.id,
      this.name,
      this.rating,
      this.year,
      this.genre,
      this.caption,
      this.info,
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
        info = data['info'],
        picUrl = data['picUrl'],
        link = data['link'];
}
