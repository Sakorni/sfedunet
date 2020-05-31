import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  List<String> books = [
    '10_nigret.jpg',
    'bezmolv_pacient.jpg',
    'face_with_shram.jpg',
    'five_five.jpg',
    'girl_in_train.webp',
    'i_find_you.jpg',
    'sherlok_holmse.jpg',
    'telefonist.jpg',
    'the_one.jpg',
    'dnk_geniya.jpg',
    'harry.jpg',
    'harry1.png',
    'harry2.jpeg',
    '20_tis_lye_pod_vodoy.jpg',
    'beliy_klik.jpg',
    'dva_capitana.jpg',
    'tainstven_ostrov.jpg',
    'tri_mushketera.jpg',
    'dvacyat_let_spustya.jpg',
    'deti_kapitana_granta.jpg',
    '1984.jpg',
    'jack_london.jpg',
    '451_po_fareng.jpg',
    'belaya_gvardiya.jpg',
    'finansist.jpg',
    'kriscniy_otec.jpg',
    'morskoy_volk.jpg',
    'nad_propastyu_vo_rzi.jpg',
    'zov_predkov.jpg',
    'vsadnic_bez_golovi.jpg',
  ];
  int start;
  int end;
  BooksBloc() {
    this.start = 0;
    this.end = 5;
  }
  @override
  BooksState get initialState => BooksMain(books: books.sublist(start, end));

  @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    if (event is FirstLoadBook) {
      yield BooksLoading(
          caption: "Идёт загрузка списка книг... Пожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      yield BooksMain(books: books.sublist(start, end));
      chageInt();
    }
    if (event is MoreBooks) {
      yield BooksLoading(
          caption: "Идёт обновление списка книг... Пожалуйста, подождите");
      await Future.delayed(Duration(seconds: 4));
      yield BooksMain(books: books.sublist(start, end));
      chageInt();
    }
  }

  void chageInt() {
    if (end == books.length - 1) {
      start = 0;
      end = 5;
      return;
    } else {
      start = end;
      end >= books.length - 6 ? end = books.length - 1 : end += 5;
    }
  }
}
