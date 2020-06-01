abstract class InsideItem {}

class Book extends InsideItem {
  final String id;
  final String name; // название книги
  final String author; //Автор книги
  final String info; // Краткое описание книги
  final String picUrl; // Ссылка на картинку(обложку)
  final String link; // Ссылка на саму книгу

  Book({this.id, this.picUrl, this.name, this.info, this.author, this.link});

  ///Преобразовывает книгу из json запроса в объект класса
  Book.fromData(Map<String, dynamic> data)
      : id = data['id'],
        picUrl = data['picUrl'],
        name = data['name'],
        author = data['author'],
        info = data['info'],
        link = data['link'];
}

class Film extends InsideItem {
  final String id;
  final String name; // Название фильма
  final String rating; //Возрастной рейтинг
  final String year; //Год выпуска
  final String country; //Год выпуска
  final String genre; // Жанр
  final String caption; // Краткое описание фильма
  final List<String> mainRoles; // Актерский состав
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
      this.country,
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
        country = data['country'],
        mainRoles = data['mainRoles'],
        picUrl = data['picUrl'],
        director = data['director'],
        link = data['link'];
}
