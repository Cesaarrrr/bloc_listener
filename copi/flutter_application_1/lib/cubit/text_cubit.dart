import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_state.dart';

class TextsCubit extends Cubit<TextsState> {
  TextsCubit() : super(TextsState.initial());

  void updateTexts(String t1, String t2, String t3) {
    emit(state.copyWith(text1: t1, text2: t2, text3: t3));
  }
}