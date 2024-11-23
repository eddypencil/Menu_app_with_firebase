import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/models/data/cart.dart';
import 'package:menu_app/models/data/meal.dart';
import 'package:menu_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  final String userId;
  const CartScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: GoogleFonts.ubuntu(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ));
              },
              icon: const Icon(
                Icons.add,
                color: AppColors.orange,
                size: 32,
              ))
        ],
      ),
      body: Builder(
        builder: (context) {
          final cart = context.watch<Cart>();
          if (cart.cart.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "NO MEALS ADDED",
                    style: GoogleFonts.ubuntu(
                        color: AppColors.orange,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(4, 4))
                        ]),
                  ),
                  const TextAddButton(),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < cart.cart.length) {
                  return CardItem(
                    meal: cart.cart.entries.elementAt(index).key,
                    amount: cart.cart.entries.elementAt(index).value,
                  );
                } else {
                  return const TextAddButton();
                }
              },
              itemCount: cart.cart.length + 1,
            );
          }
        },
      ),
      bottomSheet: CheckoutBottomSheet(userId: userId),
    );
  }
}

class TextAddButton extends StatelessWidget {
  const TextAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.add,
                  color: AppColors.orange,
                  size: 22,
                  shadows: [
                    Shadow(
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(4, 4))
                  ],
                ),
              ),
              Text(
                textAlign: TextAlign.right,
                'ADD ITEM',
                style: GoogleFonts.ubuntu(
                    color: AppColors.orange,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(4, 4))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutBottomSheet extends StatelessWidget {
  final String userId;
  const CheckoutBottomSheet({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    if (cart.cart.isEmpty) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Ink(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xffb14514),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "CheckOut",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: 24,
                        shadows: [
                          Shadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(4, 4))
                        ]),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            splashColor: const Color(0xffd2541a),
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ChangeNotifierProvider.value(
                  value: cart,
                  builder: (context, child) => Builder(
                    builder: (context) => Scaffold(
                      body: CustomDialog(userId: userId),
                    ),
                  ),
                ),
              );
            },
            child: Ink(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xfff4661e),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      "CheckOut",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          shadows: [
                            Shadow(
                                blurRadius: 8,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(4, 4))
                          ]),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${context.watch<Cart>().cartResult} \$",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        shadows: [
                          Shadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(4, 4))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

class CardItem extends StatefulWidget {
  final Meal meal;
  final int amount;

  const CardItem({super.key, required this.meal, required this.amount});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late int _newAmount;

  @override
  void initState() {
    super.initState();
    _newAmount = widget.amount; // Initialize here
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image.network(
                    widget.meal.imageUrl,
                    fit: BoxFit.cover,
                    height: 150,
                    width: 100,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.meal.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.ubuntu(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.meal.price.toString()} \$',
                          style: GoogleFonts.ubuntu(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 48),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff4661e),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_newAmount > 0) {
                                  _newAmount--;
                                  context
                                      .read<Cart>()
                                      .removeFromCart(widget.meal);
                                }
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.minus,
                              size: 18,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            _newAmount.toString(),
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xfff4661e)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _newAmount++;
                                context.read<Cart>().addToCart(widget.meal);
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              size: 18,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String userId;
  const CustomDialog({super.key, required this.userId});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    final finalcart = context.read<Cart>().cart;
    final Map<String, int> stringCart = {};

    finalcart.forEach(
      (meal, value) {
        String mealJson =
            jsonEncode(meal); // Assuming toJson() returns a string
        stringCart[mealJson] = value;
      },
    );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You're Ordering",
              style:
                  GoogleFonts.ubuntu(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...finalcart.entries.map((entry) {
                  final key = entry.key;
                  final value = entry.value;
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Text(
                          '${key.name.length > 20 ? '${key.name.substring(0, 18)}...' : key.name} ($value)',
                          style: GoogleFonts.ubuntu(fontSize: 20),
                          maxLines: 2,
                        ),
                        const Spacer(),
                        Text(
                          '${value * key.price}',
                          style: GoogleFonts.ubuntu(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    try {
                      await context.read<AuthCubit>().addOrder(
                            MealOrder(
                              orderCart: stringCart,
                              orderTime: DateTime.now(),
                            ),
                            widget.userId,
                          );
                      setState(() {
                        context.read<Cart>().clearCart();
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order placed successfully!"),
                          duration: Duration(seconds: 1),
                          backgroundColor: AppColors.orange,
                        ),
                      );

                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.of(context).popUntil((route) => route.isFirst);
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Credential invalid"),
                          duration: Duration(seconds: 1),
                          backgroundColor: AppColors.orange,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Order",
                    style: GoogleFonts.ubuntu(
                        color: const Color(0xfff4661e),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.ubuntu(
                          color: const Color(0xfff4661e),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
