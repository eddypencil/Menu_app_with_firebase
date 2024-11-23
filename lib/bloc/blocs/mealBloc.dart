import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_app/models/data/meal.dart';
import 'package:menu_app/models/repo/meal_repo.dart';

part 'mealBloc.freezed.dart';

@freezed
class MealEvent with _$MealEvent {
  const factory MealEvent.fetch() = _Fetch;
  const factory MealEvent.filtered(String category) = _Filtered;
  const factory MealEvent.addtocart(meal) = _Addtocart;
  const factory MealEvent.removefromcart(meal) = _Removefromcart;
}

@freezed
class MealState with _$MealState {
  const factory MealState.initial() = _Initial;
  const factory MealState.loading() = _Loading;
  const factory MealState.loaded({
    required List<Meal> meals,
    required List<Meal> filtered,
    required Set<String> categories,
    required String selectedCat,
  }) = _Loaded;
  const factory MealState.error(String message) = _Error;
}

class MealBloc extends Bloc<MealEvent, MealState> {
   
  
  String _selectedCat = "All";
  final Set<String> categories = {
    "All",
    "Mediterranean",
    "Fusion",
    "Mexican",
    "American",
    "Italian",
    "French",
    "Cajun",
    "Indian",
    "Comfort Food",
    "Asian",
    "Salad"
  };

  final DataRepo _dataRepo;

  MealBloc(this._dataRepo) : super(const MealState.initial()) {
    List<Meal> filteredList = [];
   

    on<_Fetch>((event, emit) async {
      try {
        emit(const MealState.loading());

        final mealList = await _dataRepo.getMeals();

        emit(MealState.loaded(
            categories: categories,
            meals: mealList,
            filtered: [],
            selectedCat: _selectedCat,
            ));
      } catch (e) {
        emit(MealState.error("Failed to fetch meals: ${e.toString()}"));
      }
    });

    on<_Filtered>((event, emit) async {
      try {
        emit(const MealState.loading());
        _selectedCat = event.category;
        final mealList = await _dataRepo.getMeals();
        if (event.category == "All") {
          filteredList = mealList;
        } else {
          filteredList = mealList
              .where((meal) => meal.category == event.category)
              .toList();
        }

        emit(MealState.loaded(
            categories: categories,
            meals: mealList,
            filtered: filteredList,
            selectedCat: _selectedCat,
           ));
      } catch (e) {
        emit(MealState.error("Failed to filter meals: ${e.toString()}"));
      }
    });
  }
}
