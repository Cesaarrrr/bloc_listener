import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(onLoginSubmitted);
  }

  Future<void> onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (event.username == "play" && event.password == "carti") {
      emit(LoginSuccess(event.username));
    } else {
      emit(LoginFailure("User o contraseña incorrecta!!"));
    }
  }
}