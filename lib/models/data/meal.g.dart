// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      name: json['name'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      instructions: json['instructions'] as String,
      calories: (json['calories'] as num).toInt(),
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
      complexity: json['complexity'] as String,
      duration: (json['duration'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'calories': instance.calories,
      'image_url': instance.imageUrl,
      'category': instance.category,
      'complexity': instance.complexity,
      'duration': instance.duration,
      'price': instance.price,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
    };
