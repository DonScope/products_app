import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/Controller/Products/cubit/products_cubit.dart';
import 'package:products_app/View/ProductScreen.dart';

class Categoriesscreen extends StatefulWidget {
  const Categoriesscreen({super.key});

  @override
  State<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends State<Categoriesscreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Clothing Shop"),
            ),
            body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: ProductsCubit.get(context).CategoryModel.length,
              itemBuilder: (context, index) {
                var appData = ProductsCubit.get(context).CategoryModel[index];
                return InkWell(
                  onTap: () {
                    if (appData != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(),
                          ));
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        '${appData}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                );
              },
            ));
      },
    );
  }
}
