import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:products_app/Model/PModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  List<ProductsModel> products = [];
  List CategoryModel = [];
  static ProductsCubit get(context) => BlocProvider.of(context);

 FetchData() async {
  emit(ProductsLoading());
  try {
    var response = await Dio().get("https://fakestoreapi.com/products");
    if (response.statusCode == 200) {
      if (response.data is List) {
        var data = response.data as List;
        products.clear(); 
        for (var element in data) {
          products.add(ProductsModel.fromJson(element));
        }
        emit(GetProduct(products));
        print("---------------------------------------- Success");
      } else {
        emit(ProductsError("Error: Response is not a list"));
        print("---------------------------------------- Error: response is not a list");
      }
    } else {
      emit(ProductsError("Error: Status code ${response.statusCode}"));
      print("---------------------------------------- Error in product's data");
    }
  } catch (e) {
    emit(ProductsError("Error fetching data: $e"));
    print("---------------------------------------- Error in product's data: $e");
  }
}

  FetchCategories() async{ 
      try {
      var response = await Dio().get("https://fakestoreapi.com/products/categories");
      if (response.statusCode == 200) {
      CategoryModel = response.data as List;
      emit(GetProduct(products));
        print("---------------------------------------- Success");
      } else {
        print("---------------------------------------- Error");
      }
    } catch (e) {
      print("---------------------------------------- Error");
    }
  }
// GetSelection(String Selection) async {
//     try {
//       var response = await Dio().get("https://fakestoreapi.com/products/category/$Selection");
//       if (response.statusCode == 200) {
//         var data = response.data as List;
//          emit(GetProduct());
//         for (var element in data) {
//           products.add(ProductsModel.fromJson(element));
//         }
//         print(products.length);
//         print("---------------------------------------- Success");
//       } else {
//         print("---------------------------------------- Error");
//       }
//     } catch (e) {
//       print("---------------------------------------- Error");
//     }
//   }

}
