import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/Controller/Products/cubit/products_cubit.dart';
import 'package:products_app/View/CategoriesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..FetchData()..FetchCategories(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'Clothing App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Categoriesscreen());
        },
      ),
    );
  }
}
