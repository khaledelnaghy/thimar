import 'unit.dart';

class ProductDetailsModel {
  int? categoryId;
  int? id;
  String? title;
  String? description;
  String? code;
  int? priceBeforeDiscount;
  double? price;
  double? discount;
  double? amount;
  int? isActive;
  bool? isFavorite;
  Unit? unit;
  List<dynamic>? images;
  String? mainImage;
  String? createdAt;

  ProductDetailsModel({
    this.categoryId,
    this.id,
    this.title,
    this.description,
    this.code,
    this.priceBeforeDiscount,
    this.price,
    this.discount,
    this.amount,
    this.isActive,
    this.isFavorite,
    this.unit,
    this.images,
    this.mainImage,
    this.createdAt,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        categoryId: json['category_id'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        code: json['code'] as String?,
        priceBeforeDiscount: json['price_before_discount'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        discount: (json['discount'] as num?)?.toDouble(),
        amount: (json['amount'] as num?)?.toDouble(),
        isActive: json['is_active'] as int?,
        isFavorite: json['is_favorite'] as bool?,
        unit: json['unit'] == null
            ? null
            : Unit.fromJson(json['unit'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        mainImage: json['main_image'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'id': id,
        'title': title,
        'description': description,
        'code': code,
        'price_before_discount': priceBeforeDiscount,
        'price': price,
        'discount': discount,
        'amount': amount,
        'is_active': isActive,
        'is_favorite': isFavorite,
        'unit': unit?.toJson(),
        'images': images,
        'main_image': mainImage,
        'created_at': createdAt,
      };
}
