import 'package:flutter_bloc/flutter_bloc.dart';

import 'cancion_state.dart';

class TextsCubit extends Cubit<TextsState> {
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
    await Future.delayed(const Duration(seconds: 2)); // Simula carga inicial
    emit(TextsState(
      cancion1: "1.Rockstar Made",
      cancion2: "2.Go2DaMoon",
      cancion3: "3.Stop Breathing",
      isLoading: false,
    ));
  }

  Future<void> updateTexts(String c1, String c2, String c3) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
      cancion1: c1,
      cancion2: c2,
      cancion3: c3,
      isLoading: false,
    ));
  }
}
