import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_app/bloc/cubits/authcubit.dart';
import 'package:menu_app/constants/colors.dart';
import 'package:menu_app/models/data/cart.dart';
import 'package:menu_app/screens/cartScreen.dart';
import 'package:menu_app/bloc/blocs/mealBloc.dart';
import 'package:menu_app/models/data/meal.dart';

class DetailsScreen extends StatelessWidget {
  final Meal meal;
  const DetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,
                  color: AppColors.orange, size: 28),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      meal.name,
                      style: GoogleFonts.ubuntu(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: AppColors.orange,
                            ),
                            Text(
                              '${meal.duration} Min',
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: AppColors.grey),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.local_fire_department_outlined,
                              color: AppColors.orange,
                            ),
                            Text(
                              meal.complexity,
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: AppColors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Instructions :",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        meal.instructions,
                        style: GoogleFonts.ubuntu(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredients :",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: meal.ingredients
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              child: Text(
                                '• $e',
                                style: GoogleFonts.ubuntu(fontSize: 14),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended :",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    BlocBuilder<MealBloc, MealState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const CircularProgressIndicator(),
                          loading: () => const CircularProgressIndicator(),
                          loaded: (meals, filtered, categories, selectedCat) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CarouselSlider.builder(
                                    itemCount: 7,
                                    itemBuilder: (context, index, realIndex) =>
                                        CarouselSlide(meal: meals[index]),
                                    options: CarouselOptions(
                                      height: 200,
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 0.75,
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 5),
                                    )),
                              ),
                            );
                          },
                          error: (message) =>
                              const Center(child: Text("Error")),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: AddToCartFAB(meal: meal),
    );
  }
}

class AddToCartFAB extends StatelessWidget {
  const AddToCartFAB({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().currentUserId!;
    return FloatingActionButton(
      elevation: 8,
      backgroundColor: AppColors.orange,
      onPressed: () {
        context.read<Cart>().addToCart(meal);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartScreen(
                  userId: userId,
                )));
      },
      child: Icon(
        FontAwesomeIcons.plus,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 4),
            blurRadius: 8,
          )
        ],
      ),
    );
  }
}

class CarouselSlide extends StatelessWidget {
  final Meal meal;
  const CarouselSlide({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final mealBloc = BlocProvider.of<MealBloc>(context);
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: mealBloc,
                child: DetailsScreen(meal: meal),
              ),
            ));
      },
      child: SizedBox(
        width: 300,
        height: 200,
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Image.network(
                  width: 300,
                  height: 200,
                  meal.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        meal.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color:
                                  Colors.black.withOpacity(0.5), // Shadow color
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
