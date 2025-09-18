

class TextsState {
  final String cancion1;
  final String cancion2;
  final String cancion3;
  final bool isLoading;

  TextsState({
    required this.cancion1,
    required this.cancion2,
    required this.cancion3,
    this.isLoading = false,
  });

  TextsState copyWith({
    String? cancion1,
    String? cancion2,
    String? cancion3,
    bool? isLoading,
  }) {
    return TextsState(
      cancion1: cancion1 ?? this.cancion1,
      cancion2: cancion2 ?? this.cancion2,
      cancion3: cancion3 ?? this.cancion3,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
