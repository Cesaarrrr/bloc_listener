import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class FailureView extends StatelessWidget {
  const FailureView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state as LoginFailure;

    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.network ("https://media.istockphoto.com/id/827247322/es/vector/se%C3%B1al-de-peligro-vector-icono-ilustraci%C3%B3n-de-atenci%C3%B3n-atenci%C3%B3n-negocio-concepto-simple-plana.jpg?s=612x612&w=0&k=20&c=iEXTniBp9NMjwYdYvsAuaV6NyvMHAmOtTlfXT5ipR-w=", height: 200),
            Text(state.message, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 80),
          
          ],
        ),
      ),
    );
  }
}