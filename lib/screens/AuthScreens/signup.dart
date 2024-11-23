import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/constants/regex.dart';
import 'package:menu_app/screens/AuthScreens/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 
  File? _selectedImage;
  bool _isloading = false;
   String?_imageBase64;

  final TextEditingController _pass = TextEditingController();
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isloading = true;
      });
      log(_email);

      final authCubit = context.read<AuthCubit>();
      

      setState(() {
        _isloading = false;
      });
      authCubit.stream.listen((state) => 
      state.when(
            initial: (){
              return null;
            },
            loading: (){
              return null;
            },
            loaded: (user) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Registration Successful! Welcome, ${user.email}!'),
                duration: const Duration(seconds: 2),
                backgroundColor: AppColors.orange,
              ));
              Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen(),));
              return null;
            },
            error: (message) =>
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 2),
              backgroundColor: AppColors.orange,
            )),
          ),);
          await authCubit.signUp(_email, _password,_imageBase64!);
           
    }
  }

 Future<void> _pick_image() async {
  final ImagePicker imagePicker = ImagePicker();
  setState(() {
    _isloading = true;
  });

  log(_isloading.toString());
  
  try {
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery,imageQuality: 50,);
    
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path); 
      });

      
      final bytes = await File(pickedImage.path).readAsBytes();
      setState(() {
        _imageBase64 = base64Encode(bytes); 
      });
    } else {
      log('No image selected.'); 
    }
  } catch (e) {
    log('Error picking image: ${e.toString()}'); 
  } finally {
    setState(() {
      _isloading = false; 
    });
  }

  log(_isloading.toString());
}

  @override
  void dispose() {
    super.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!",
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
                if (_selectedImage != null)
                  InkWell(
                    onTap: _isloading ? null : _pick_image,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_selectedImage!),
                    ),
                  )
                else
                  InkWell(
                    onTap: _isloading ? null : _pick_image,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                    ),
                  ),
                const SizedBox(height: 16),
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
                          if (_selectedImage == null) {
                            return "Please add an image";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _email = newValue!;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _pass,
                        obscureText: _obscureText,
                        autocorrect: false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          labelText: "Enter Password",
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          if (!Regex.passwordRegex.hasMatch(value)) {
                            return "Enter a valid Password";
                          }
                          if (_selectedImage == null) {
                            return "Please add an image";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _password = newValue!;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        obscureText: _obscureText,
                        autocorrect: false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          labelText: "Confirm Password",
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm Password";
                          }
                          if (value != _pass.text) {
                            return 'Passwords do not match';
                          }
                          if (_selectedImage == null) {
                            return "Please add an image";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Password requirements:\n"
                        "• At least 8 characters\n"
                        "• At least one lowercase letter\n"
                        "• At least one uppercase letter\n"
                        "• At least one numeric digit\n"
                        "• At least one special character",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(AppColors.orange),
                          ),
                          onPressed: _isloading ? null : _submit,
                          child: _isloading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Or",
                  style: GoogleFonts.poppins(color: AppColors.orange, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    Builder(builder: (context) {
                      return TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(color: AppColors.orange),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
