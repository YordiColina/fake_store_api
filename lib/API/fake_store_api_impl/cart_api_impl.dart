import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../log_printer/logger_service.dart';
import '../../models/fake_cart_data/cart.dart';
import '../errors/api_error_handler.dart';
import '../services/cart_service.dart';



class CartApiImpl {

  CartApiImpl();

  final CartService _cartService = CartService.create();
  final LoggerService _loggerService = LoggerService();


  Future<Either<String, Cart>> getCart(int cartId) async {
    return await ApiErrorHandler.execute(() async {
      final response = await _cartService.getCart(cartId);
      if (response.isSuccessful) {
        final data = response.body as Map<String, dynamic>;
        final Cart cart = Cart.fromJson(data);
        for (var carts in cart.products) {
          _loggerService.logInfo(
              'Carrito  obtenido correctamente\n ${response.statusCode}\n'
                  'carrito nro ${cart.id}\n'
                  'id de producto ${carts.productId}\n'
                  'cantidad de ese producto ${carts.quantity}');
        }
        return cart;
      } else {
        throw HttpException(
            'API Error: ${response.statusCode} - ${response.error ??
                "Unknown error"}');
      }
    });
  }
}


