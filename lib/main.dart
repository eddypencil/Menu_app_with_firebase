import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/models/data/cart.dart';
import 'package:menu_app/models/repo/auth_repo.dart';
import 'package:menu_app/models/repo/firestoragerepo.dart';
import 'package:menu_app/screens/AuthScreens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: BlocProvider(
      create: (context) =>
         AuthCubit(AuthRepo(),FirestoreRepo()),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const LoginScreen()),
    ),
  ));
}
