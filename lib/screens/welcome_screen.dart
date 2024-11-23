import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/bloc/blocs/mealBloc.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/models/data/meal.dart';
import 'package:menu_app/models/repo/meal_repo.dart';
import 'package:menu_app/screens/cartScreen.dart';
import 'package:menu_app/screens/details.dart';
import 'package:menu_app/screens/pastorders.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealBloc(DataRepo()),
      child: const RealScreen(),
    );
  }
}

class RealScreen extends StatelessWidget {
  const RealScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authcubit = context.read<AuthCubit>();
    context.read<MealBloc>().add(const MealEvent.filtered("All"));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 6,
        title: const Text('ORDER NOW'),
        backgroundColor: AppColors.darkGrey,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.orange,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartScreen(userId: authcubit.currentUserId!),
                ));
              },
            );
          }),
          IconButton(
              onPressed: () {
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: authcubit,
                        child: const PastOrders(),
                      ),
                    ));
              },
              icon: const Icon(
                Icons.assignment,
                color: AppColors.orange,
              ))
        ],
      ),
      body: BlocBuilder<MealBloc, MealState>(
        builder: (context, state) {
          return state.when(
            initial: () => const CircularProgressIndicator(),
            loading: () => const CircularProgressIndicator(),
            loaded: (meals, filtered, categories, selectedCat) => SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      const GreetingWidget(),
                      PageViewCards(
                        popularMeals: meals.sublist(0, 5),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Categories", style: TextStyle(fontSize: 28)),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories
                              .map((category) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(8),
                                      elevation: 6,
                                      clipBehavior: Clip.antiAlias,
                                      color: selectedCat == category
                                          ? AppColors.orange
                                          : AppColors.darkGrey,
                                      child: InkWell(
                                        splashColor: AppColors.orange,
                                        onTap: () {
                                          context.read<MealBloc>().add(
                                              MealEvent.filtered(category));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(category),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filtered.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.75, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GridCard(
                            meal: filtered[index],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}

class PageViewCards extends StatelessWidget {
  final List<Meal> popularMeals;
  const PageViewCards({
    super.key,
    required this.popularMeals,
  });

  @override
  Widget build(BuildContext context) {
    final mealBloc = BlocProvider.of<MealBloc>(context);
    final pagecontroller = PageController();
    int currentIndex = 0;

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: mealBloc,
              child: DetailsScreen(
                meal: popularMeals[currentIndex],
              ),
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: pagecontroller,
              pageSnapping: true,
              itemCount: popularMeals.length,
              itemBuilder: (context, index) {
                currentIndex = index;
                return MealCard(
                  meal: popularMeals[index],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          SmoothPageIndicator(
            controller: pagecontroller,
            count: 5, // Number of cards
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.orange,
              dotColor: AppColors.grey,
              dotHeight: 6,
              dotWidth: 6,
              expansionFactor: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.darkGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular for Dinner",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      meal.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.timelapse_outlined,
                                color: AppColors.orange,
                              ),
                              Text(
                                "${meal.duration} Min",
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_fire_department_outlined,
                                  color: AppColors.orange,
                                ),
                                Text(
                                  meal.complexity,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  meal.imageUrl,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(child: CircularProgressIndicator()));
                  },
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authstate) {
        return authstate.when(
          initial: () => const Center(
            child: CircleAvatar(),
          ),
          loading: () {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 70,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hey,",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text("Ready to order something?")
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator(),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          loaded: (user) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 70,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hey, User",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text("Ready to order something?")
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.memory(
                                base64Decode(user.profileImageUrl))),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (message) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 70,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hey, User",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text("Ready to order something?")
                        ],
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class GridCard extends StatelessWidget {
  final Meal meal;
  const GridCard({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final mealBloc = BlocProvider.of<MealBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: mealBloc,
                child: DetailsScreen(
                  meal: meal,
                ),
              ),
            ),
          );
        },
        child: Container(
          height: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.darkGrey),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    meal.imageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const SizedBox(
                          width: 120,
                          height: 120,
                          child: Center(child: CircularProgressIndicator()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  meal.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(meal.duration.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.start),
                        Text('Min',
                            style: GoogleFonts.roboto(fontSize: 14),
                            textAlign: TextAlign.start)
                      ],
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          meal.complexity,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text('Lvl',
                            style: GoogleFonts.roboto(fontSize: 14),
                            textAlign: TextAlign.start)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
