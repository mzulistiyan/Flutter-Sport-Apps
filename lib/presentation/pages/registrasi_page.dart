import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/auth_cubit.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class RegistrasiPage extends StatelessWidget {
  RegistrasiPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
                filled: true,
                fillColor: Colors.grey,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                filled: true,
                fillColor: Colors.grey,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is AuthSuccess) {
                  Get.to(HomePage());
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                  child: Text('registrasi'),
                  onPressed: () => {
                    context.read<AuthCubit>().signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        )
                  },
                );
                ;
              },
            ),
          ],
        ),
      )),
    );
  }
}
