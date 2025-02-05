

import 'package:api_fake_store/API/fake_store_api_impl/categories_api_impl.dart';
import 'package:api_fake_store/API/fake_store_api_impl/product_api_impl.dart';
import 'API/fake_store_api_impl/cart_api_impl.dart';

ProductApiImpl productApiImpl = ProductApiImpl();
CategoriesApiImpl categoriesApiImpl = CategoriesApiImpl();
CartApiImpl  cartApiImpl = CartApiImpl();

 void apiConsumption(int id) {
  productApiImpl.getAllProducts();
  categoriesApiImpl.getCategories();
  cartApiImpl.getCart(id);
}
