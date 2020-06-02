import 'package:cached_network_image/cached_network_image.dart';

class Book {
  final String id;
  final String name; // название книги
  final String author; //Автор книги
  final String info; // Краткое описание книги
  final String picUrl; // Ссылка на картинку(обложку)
  final String link; // Ссылка на саму книгу
  CachedNetworkImageProvider image;
  Book({this.id, this.picUrl, this.name, this.info, this.author, this.link}) {
    this.image = new CachedNetworkImageProvider(this.picUrl ??
        "https://images.jerichowriters.com/JUvjrMo-2Z1ZVu47/w:auto/h:auto/q:75/https://jerichowriters.com/wp-content/uploads/feature-192-how-to-write-a-book.jpg");
  }

  ///Преобразовывает книгу из json запроса в объект класса
  Book.fromData(Map<String, dynamic> data)
      : id = data['id'].toString(),
        picUrl = data['img'],
        name = data['name'],
        author = data['author'],
        info = data['info'],
        link = data['source'] {
    this.image = new CachedNetworkImageProvider(this.picUrl ??
        "https://images.jerichowriters.com/JUvjrMo-2Z1ZVu47/w:auto/h:auto/q:75/https://jerichowriters.com/wp-content/uploads/feature-192-how-to-write-a-book.jpg");
  }
}

class Film {
  final String id;
  final String name; // Название фильма
  final String rating; //Возрастной рейтинг
  final String year; //Год выпуска
  final String country; //Год выпуска
  final String genre; // Жанр
  final String caption; // Краткое описание фильма
  final String mainRoles; // Актерский состав
  final String director; // Cценарист и тд
  final String picUrl; // Ссылка на заглавную картинку фильма
  final String link; // Ссылка на сам фильм
  CachedNetworkImageProvider image;

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
      this.link}) {
    this.image = new CachedNetworkImageProvider(this.picUrl ??
        "https://lh3.googleusercontent.com/proxy/5Xr3fA89i9k0xfKkMmXGfRiQV3goeBcpHLPxqF7b9ypTf0iACf-P0JaQu-_5QBnVICg9yHLtnclqZZ_ehKm8qcU_tjpNNAQyTEWLO_Po46PkzTEdjT2YRmeyMftt_8fYljZY");
  }

  ///Преобразовывает фильм из json запроса в объект класса
  Film.fromData(Map<String, dynamic> data)
      : id = data['id'].toString(),
        name = data['name'],
        rating = data['pg'].toString(),
        year = data['year'].toString(),
        genre = data['genre'],
        caption = data['caption'],
        country = data['countri'],
        mainRoles = data['actors'],
        picUrl = data['img'],
        director = data['director'],
        link = data['source'] {
    this.image = new CachedNetworkImageProvider(this.picUrl ??
        "https://lh3.googleusercontent.com/proxy/5Xr3fA89i9k0xfKkMmXGfRiQV3goeBcpHLPxqF7b9ypTf0iACf-P0JaQu-_5QBnVICg9yHLtnclqZZ_ehKm8qcU_tjpNNAQyTEWLO_Po46PkzTEdjT2YRmeyMftt_8fYljZY");
  }
}
