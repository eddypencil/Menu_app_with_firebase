import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menu_app/models/data/meal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_app/models/repo/auth_repo.dart';
import 'package:menu_app/models/repo/firestoragerepo.dart';

part 'authcubit.freezed.dart'; // Ensure this matches your file naming

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loaded(UserModel user) =
      _Loaded; // Assuming User is defined somewhere
  const factory AuthState.error(String message) = _Error;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._authRepo,
    this._firestoreRepo,
  ) : super(const AuthState.initial());

  String? currentUserId;
  Map<String, dynamic>? userdata;

  final AuthRepo _authRepo;
  final FirestoreRepo _firestoreRepo;

  Future<void> signUp(String email, String password, String userImage) async {
    try {
      emit(const AuthState.loading());
      UserCredential? userCredential = await _authRepo.signUp(email, password);
      if (userCredential != null) {
        await _firestoreRepo.addUserData(userCredential.user!.uid, {
          'email': email,
          'profileImageUrl': userImage,
          'orders': [],
        });
        emit(AuthState.loaded(
            UserModel(email: email, profileImageUrl: userImage)));
      } else {
        emit(const AuthState.error("Sign up failed"));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential? userCredential = await _authRepo.login(email, password);
      if (userCredential != null) {
        final DocumentSnapshot data =
            await _firestoreRepo.getUserData(userCredential.user!.uid);
        if (data.exists) {
          userdata = data.data() as Map<String, dynamic>;
          log(userdata.toString());
          log('done');
          log(userdata!['orders'].toString());
          currentUserId = userCredential.user!.uid;

          emit(AuthState.loaded(UserModel(
              email: userdata!["email"],
              profileImageUrl: userdata!["profileImageUrl"])));
        } else {
          emit(const AuthState.error("User data not found."));
        }
      } else {
        emit(const AuthState.error("Login failed"));
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> addOrder(MealOrder order, String userId) async {
    try {
      await _firestoreRepo.addOrder(userId, order);
    } catch (e) {
      log("${e}add order");
    }
  }

  Future<String?> getOrders( String userId) async {
    try {
      final DocumentSnapshot data = await _firestoreRepo.getUserData(userId);
      if (data.exists) {
        final Map<String, dynamic>? userdata =
            data.data() as Map<String, dynamic>?;
        if (userdata != null && userdata.containsKey('orders')) {
          final orderData = userdata['orders'].toString();
          log(orderData);
          return orderData;
        }
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    _authRepo.signOut();
    emit(const AuthState.initial());
  }
}
