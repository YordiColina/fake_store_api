
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "userId")
  final int userId;

  @JsonKey(name: "date")
  final DateTime date;

  @JsonKey(name: "products")
  final List<CartProducts> products;

  const Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()

class CartProducts {
  @JsonKey(name: "productId")
  final int productId;

  @JsonKey(name: "quantity")
  final int quantity;

  const CartProducts({
    required this.productId,
    required this.quantity,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) => _$CartProductsFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductsToJson(this);
}