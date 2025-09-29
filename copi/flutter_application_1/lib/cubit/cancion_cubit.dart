import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'cancion_state.dart';

class TextsCubit extends Cubit<TextsState> {
  final Dio _dio = Dio();

  TextsCubit()
      : super(TextsState(
          cancion1: "",
          cancion2: "",
          cancion3: "",
          isLoading: true,
        )) {
    _loadInitialTexts();
  }

  Future<void> _loadInitialTexts() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(TextsState(
      cancion1: "1.Rockstar Made",
      cancion2: "2.Go2DaMoon",
      cancion3: "3.Stop Breathing",
      isLoading: false,
    ));
  }

  Future<void> updateTexts(String c1, String c2, String c3) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await _dio.post(
        "https://mocki.io/v1/84d0b59a-f01e-4b31-ac4a-f907cbeefbf2",
        data: {
          "cancion1": c1,
          "cancion2": c2,
          "cancion3": c3,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        emit(state.copyWith(
          cancion1: data["cancion1"] ?? c1,
          cancion2: data["cancion2"] ?? c2,
          cancion3: data["cancion3"] ?? c3,
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
        print("Error: ${response.statusCode}");
      }
    } on DioError catch (e) {
      emit(state.copyWith(isLoading: false));
      print("Error en POST: ${e.message}");
    }
  }
}
