import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String name,
    required List<String> ingredients,
    required String instructions,
    required int calories,
    @JsonKey(name: 'image_url') required String imageUrl,
    required String category,
    required String complexity,
    required int duration,
    required int price,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    required String profileImageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

class MealOrder {
  final Map<String,dynamic> orderCart;
  final DateTime orderTime;

  MealOrder({
    required this.orderCart,
    required this.orderTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderCart': orderCart,
      'orderTime': DateFormat('yyyy-MM-dd HH:mm').format(orderTime).toString(),
    };
  }

  factory MealOrder.fromJson(Map<String, dynamic> json) {
    return MealOrder(
      orderCart: json['orderCart'] as Map<String, dynamic>,
      orderTime: DateFormat('yyyy-MM-dd HH:mm').parse(json['orderTime'] as String),
    );
  }
  
}
