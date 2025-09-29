import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cancion_cubit.dart';
import '../cubit/cancion_state.dart';

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
                  Image.network(
                    "https://i.scdn.co/image/ab67616d0000b27398ea0e689c91f8fea726d9bb",
                    height: 190,
                  ),
                  const SizedBox(height: 20),

                  if (state.isLoading)
                    const CircularProgressIndicator()
                  else ...[
                    Text(state.cancion1, style: const TextStyle(fontSize: 20)),
                    Text(state.cancion2, style: const TextStyle(fontSize: 20)),
                    Text(state.cancion3, style: const TextStyle(fontSize: 20)),
                  ],

                
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
