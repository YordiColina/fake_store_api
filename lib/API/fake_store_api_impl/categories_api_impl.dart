import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../log_printer/logger_service.dart';
import '../../models/fake_product_categories/categories.dart';
import '../errors/api_error_handler.dart';
import '../services/product_service.dart';


class CategoriesApiImpl {
  CategoriesApiImpl();

  final ProductService _productService = ProductService.create();
  final LoggerService _loggerService = LoggerService();

  Future<Either<String, Categories>> getCategories() async {
    return await ApiErrorHandler.execute(() async {
      final response = await _productService.getCategories();
      if (response.isSuccessful) {
        final data = response.body as List<dynamic>;
        final Categories categories = Categories.fromJson(data);
        _loggerService.logInfo(
            'Categorías obtenidas correctamente\n ${response.statusCode}\n'
                ' ${categories.categories}');

        return categories;
      } else {
        throw HttpException(
            'API Error: ${response.statusCode} - ${response.error ??
                "Unknown error"}');
      }
    });
  }
}




