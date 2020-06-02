import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

Requests req = new Requests();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState =>
      LoginLoading(caption: "Идёт проверка данных\nПожалуйста, подождите");

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is FirstLoadingLogin) {
      yield LoginLoading(
          caption: "Идёт проверка данных\nПожалуйста, подождите");
      await Future.delayed(Duration(seconds: 1, milliseconds: 50));
      final prefs = await SharedPreferences.getInstance();
      final password = prefs.getString('password') ?? 0;
      final login = prefs.getString('login') ?? 0;
      print(login);
      print(password);
      if (password == 0) {
        yield LoginInitial();
      } else {
        User user = await req.getToken(login: login, password: password);
        if (user != null) {
          yield LoginSuccess(user: user);
          yield LoginInitial();
        } else
          yield LoginInitial(failed: true);
      }
    }
    if (event is CheckLogin) {
      yield LoginLoading(
          caption: "Идёт проверка данных\nПожалуйста, подождите");
      try {
        User user =
            await req.getToken(login: event.login, password: event.password);
        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('login', event.login);
          prefs.setString('password', event.password);
          yield LoginSuccess(user: user);
          yield LoginInitial();
        } else
          yield LoginInitial(failed: true);
      } catch (e) {
        yield LoginInitial(failed: true);
      }
    }
    if (event is Exit) {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('login');
      prefs.remove('password');
      yield LoginInitial();
    }
  }
}
