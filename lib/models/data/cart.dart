import 'package:flutter/material.dart';
import 'package:menu_app/models/data/meal.dart';

class Cart with ChangeNotifier {
  static final Cart _instance = Cart._internal();

  // Private constructor
  Cart._internal();

  factory Cart() {
    return _instance;
  }

  final Map<Meal, int> _cart = {};
  Map<Meal, int> get cart => _cart;

  double get cartResult {
    return _cart.entries.fold(0.0, (total, entry) => total + (entry.key.price * entry.value));
  }

  void addToCart(Meal meal) {
    if (_cart.containsKey(meal)) {
      _cart[meal] = _cart[meal]! + 1;
    } else {
      _cart[meal] = 1;
    }
    notifyListeners();  // Notify listeners after changing the cart
  }

  void removeFromCart(Meal meal) {
    if (_cart.containsKey(meal)) {
      _cart[meal] = _cart[meal]! - 1;
      if (_cart[meal] == 0) {
        _cart.remove(meal);
      }
      notifyListeners();  // Notify listeners after changing the cart
    }
  }

  void clearCart(){
    _cart.clear();
  }
}
