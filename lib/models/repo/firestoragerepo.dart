
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menu_app/models/data/meal.dart';

class FirestoreRepo{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;



  Future<void> addUserData(String userId, Map<String, dynamic> data)async{

   await _firestore.collection("user").doc(userId).set(data);


  }

  Future<DocumentSnapshot> getUserData(String userId)async{

   return await _firestore.collection("user").doc(userId).get();


  }


  Future<void> addOrder(String userId,MealOrder order)async{

   await _firestore.collection("user").doc(userId).update({
        'orders': FieldValue.arrayUnion([jsonEncode(order)]),
      });


  }


  









}