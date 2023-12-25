import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakila_store_project/helper/shared_pref.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUninitialized()) {
    on<LoggedIn>(loggedIn);
  }
  void loggedIn(LoggedIn event, Emitter emit) async {
    String cookie = await SharedPref.getCookie();
    await Future.delayed(const Duration(seconds: 2)).then((_) {
      if (cookie.isNotEmpty) {
        return emit(AuthAuthenticated());
      } else {
        return emit(AuthUnauthenticated());
      }
    });
  }
}
