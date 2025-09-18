import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/text_cubit.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextsCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Éxito")),
        body: BlocBuilder<TextsCubit, TextsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_c0BoyKReS6MZr2rWYLb3e9a26P3vsIGaYA&s", height: 120),
                const SizedBox(height: 20),
                Text(state.text1, style: const TextStyle(fontSize: 20)),
                Text(state.text2, style: const TextStyle(fontSize: 20)),
                Text(state.text3, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<TextsCubit>().updateTexts(
                      "Nuevo texto 1",
                      "Nuevo texto 2",
                      "Nuevo texto 3",
                    );
                  },
                  child: const Text("Cambiar textos"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}