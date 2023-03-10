import 'package:contact_tracing_3d/constants/style_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterClientScreen extends StatefulWidget {
  const RegisterClientScreen({super.key});

  @override
  State<RegisterClientScreen> createState() => _RegisterClientScreenState();
}

class _RegisterClientScreenState extends State<RegisterClientScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  bool obscurePassword = true;

  void registerClient() async {
    try {
      EasyLoading.show(
        status: 'Processing...',
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'a2@g.com',
        password: '1234567890',
      );
      EasyLoading.showSuccess('User account has been registered.');
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        EasyLoading.showError(
            'Your password is weak. Please enter more than 6 characters.');
      } else if (ex.code == 'email-already-in-use') {
        EasyLoading.showError(
            ('Your password is already registered. Please enter a new email address.'));
      }
      print(ex.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputTextSize = TextStyle(
      fontSize: 16,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/illustration.webp'),
            opacity: 0.6,
          ),
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Register your account:'),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                style: inputTextSize,
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                obscureText: obscurePassword,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                style: inputTextSize,
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                obscureText: obscurePassword,
                controller: confirmpassController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                style: inputTextSize,
              ),
              ElevatedButton(
                onPressed: registerClient,
                style: ElevatedButton.styleFrom(
                  shape: roundedShape,
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
