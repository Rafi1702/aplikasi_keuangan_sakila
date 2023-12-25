import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sakila_store_project/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>(login);
  }

  void login(Login event, Emitter emit) async {
    emit(LoginLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      await AuthService().login(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
