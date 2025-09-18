part of 'text_cubit.dart';

class TextsState {
  final String text1;
  final String text2;
  final String text3;

  const TextsState({
    required this.text1,
    required this.text2,
    required this.text3,
  });

  factory TextsState.initial() {
    return const TextsState(
      text1: "Texto inicial 1",
      text2: "Texto inicial 2",
      text3: "Texto inicial 3",
    );
  }

  TextsState copyWith({String? text1, String? text2, String? text3}) {
    return TextsState(
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
    );
  }
}