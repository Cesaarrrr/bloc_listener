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
        appBar: AppBar(title: const Text("Whole Lotta Red")),
        body: BlocBuilder<TextsCubit, TextsState>(
          builder: (context, state) {
            return Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("https://i.scdn.co/image/ab67616d0000b27398ea0e689c91f8fea726d9bb", height: 190),
                const SizedBox(height: 20),
                Text(state.text1, style: const TextStyle(fontSize: 20)),
                Text(state.text2, style: const TextStyle(fontSize: 20)),
                Text(state.text3, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<TextsCubit>().updateTexts(
                      "Sky!",
                      "Vamp Anthem",
                      "New Tank",
                    );
                  },
                  child: const Text("Cambiar Nombres"),
                )
              ],
            ) 
            );
          },
        ),
      ),
    );
  }
}