import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/constants/regex.dart';
import 'package:menu_app/models/repo/auth_repo.dart';
import 'package:menu_app/models/repo/firestoragerepo.dart';
import 'package:menu_app/screens/AuthScreens/signup.dart';
import 'package:menu_app/screens/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _togglePasswordvisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isloading = true;
      });
      final authcubit = context.read<AuthCubit>();
      await authcubit.login(_email, _password).then(
            (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(value: authcubit,child: const WelcomeScreen(),),
                )),
          ).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Credential invalid"),
            duration: Duration(seconds: 2),
              backgroundColor: AppColors.orange,
          ),
        );
      });
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo(), FirestoreRepo()),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome back!",
                  style: GoogleFonts.poppins(
                      fontSize: 42,
                      color: AppColors.orange,
                      shadows: [
                        Shadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(4, 4))
                      ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autocorrect: false,
                        decoration: const InputDecoration(
                          labelText: "Enter Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          if (!Regex.emailRegex.hasMatch(value)) {
                            return "Enter a valid Email";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _email = newValue!;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        autocorrect: false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: _togglePasswordvisibility,
                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          labelText: "Enter Password",
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }

                          return null;
                        },
                        onSaved: (newValue) {
                          _password = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _isloading ? null : _login,
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(AppColors.orange)),
                      child: _isloading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Login",
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                    )
                  ],
                ),
                Text(
                  "Or",
                  style: GoogleFonts.poppins(
                      color: AppColors.orange, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    Builder(builder: (context) {
                      return TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(color: AppColors.orange),
                          ));
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
