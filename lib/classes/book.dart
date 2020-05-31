class Book {
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
