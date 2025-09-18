import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class InicialView extends StatefulWidget {
  const InicialView({super.key});

  @override
  State<InicialView> createState() => InicialViewState();
}

class InicialViewState extends State<InicialView> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network ("https://i1.sndcdn.com/artworks-6S0p70w7UME8-0-t500x500.jpg",height: 190),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Contraseña"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().add(
                      LoginSubmitted(
                        username: _userController.text,
                        password: _passController.text,
                      ),
                    );
              },
              child: const Text("Ingresar"),
            )
          ],
        ),
      ),
    );
  }
}