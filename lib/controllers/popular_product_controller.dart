import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/product_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update(); // such as setState();
    }else{

    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = _quantity + 1;
      // print("increment"+_quantity.toString());
    }
    else{
      _quantity = _quantity - 1;
      print("decrement"+_quantity.toString());
    }
    update();
  }
}
