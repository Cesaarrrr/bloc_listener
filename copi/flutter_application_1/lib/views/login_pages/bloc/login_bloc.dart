import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio _dio = Dio();

  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(onLoginSubmitted);
  }

  Future<void> onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final response = await _dio.get(
        "https://mocki.io/v1/c32d73fe-a963-47e1-a7e7-f267093fc468",
        queryParameters: {
          "email": event.email,
          "password": event.password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data["email"] == event.email &&
            data["password"] == event.password) {
          emit(LoginSuccess(data["email"]));
        } else {
          emit(LoginFailure("Usuario o contraseña incorrectos"));
        }
      } else {
        emit(LoginFailure("Error: ${response.statusCode}"));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        emit(LoginFailure(e.response?.data["message"] ?? "Error en login"));
      } else {
        emit(LoginFailure("Error de red: ${e.message}"));
      }
    } catch (e) {
      emit(LoginFailure("Excepción: $e"));
    }
  }
}
