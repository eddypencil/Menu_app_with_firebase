import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/models/data/meal.dart';
import 'package:intl/intl.dart';

class PastOrders extends StatefulWidget {
  const PastOrders({super.key});

  @override
  State<PastOrders> createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final Future<String?> ordersFuture =
        authCubit.getOrders(authCubit.currentUserId!);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: FutureBuilder<String?>(
        future: ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No past orders"));
          } else {
            List<dynamic> jsonOrders = jsonDecode(snapshot.data!);

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75, crossAxisCount: 2),
              itemCount: jsonOrders.length,
              itemBuilder: (context, index) =>
                  HistoryCard(order: MealOrder.fromJson(jsonOrders[index])),
            );
          }
        },
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final MealOrder order;
  const HistoryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    log(order.orderTime.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Ordered at: ",
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd hh:mm a')
                          .format(order.orderTime),
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), 
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: order.orderCart.entries.map((entry) {
                      final meal = Meal.fromJson(jsonDecode(entry.key));
                      final quantity = entry.value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${meal.name.length > 20 ? '${meal.name.substring(0, 20)}...' : meal.name} x$quantity',
                                style: GoogleFonts.ubuntu(
                                    fontSize: 16, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$${(quantity * meal.price).toStringAsFixed(2)}', // Format price
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
