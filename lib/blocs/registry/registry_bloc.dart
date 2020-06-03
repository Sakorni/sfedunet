import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'registry_event.dart';
part 'registry_state.dart';

Requests req = new Requests();

class RegistryBloc extends Bloc<RegistryEvent, RegistryState> {
  @override
  RegistryState get initialState => RegistryInitial();

  @override
  Stream<RegistryState> mapEventToState(
    RegistryEvent event,
  ) async* {
    if (event is CheckRegistry) {
      yield RegistryLoading(
          caption: "Производится регистрация\nПожалуйста, подождите");
      try {
        bool success = await req.reg(
            login: event.login, password: event.password, email: event.email);

        if (success) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('login', event.login);
          prefs.setString('password', event.password);
          User user =
              await req.getToken(login: event.login, password: event.password);
          yield RegistrySuccess(user: user);
          yield RegistryInitial();
        } else
          yield RegistryInitial(failed: true);
      } catch (e) {
        yield RegistryInitial(failed: true);
      }
    }
  }
}
