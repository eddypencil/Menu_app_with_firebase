import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:menu_app/models/data/meal.dart';

class DataRepo{

  Future<List<Meal>> getMeals() async{
  try{
  String jsonString = await rootBundle.loadString('assets/json/meals.json');
  List<dynamic> mealJson = json.decode(jsonString);
  List<Meal> meals = mealJson.map((mealJson) => Meal.fromJson(mealJson)).toList() ;
  print(meals.toString());
  return meals;
  }catch (e){
    print(e);
    return [];
  }

}
}