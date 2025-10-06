import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_pages/bloc/login_bloc.dart';
import 'login_pages/bloc/login_event.dart';
import 'login_pages/bloc/login_state.dart';
import 'succes_view.dart';

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
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SuccessView(),
                  ),
                );
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://i1.sndcdn.com/artworks-6S0p70w7UME8-0-t500x500.jpg",
                      height: 190,
                    ),
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(labelText: "EMAIL"),
                      style: const TextStyle(color: Color.fromARGB(255, 252, 4, 4)),
                    ),
                    TextField(
                      controller: _passController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "PASSWORD"),
                      style: const TextStyle(color: Color.fromARGB(255, 252, 4, 4)),
                    ),
                    const SizedBox(height: 20),
                    if (state is LoginLoading)
                      const CircularProgressIndicator(color: Colors.red)
                    else
                      ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  email: _userController.text,
                                  password: _passController.text,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 133, 14, 14),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Ingresar"),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
