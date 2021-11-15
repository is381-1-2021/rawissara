import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  final String title;
  final String subtitle;
  final int price;
  final String imgpath;
  final int color;
  final String detail;

  ProductModel(this.title, this.subtitle, this.price, this.imgpath,this.color,this.detail);

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ProductModel(
      json['title'] as String,
      json['subtitle'] as String,
      json['price'] as int,
      json['imgpath'] as String,
      json['color'] as int,
      json['detail'] as String,
    );
  }
}

class AllProducts {
  final List<ProductModel> products;

  AllProducts(this.products);

  factory AllProducts.fromJson(
    List<dynamic> json,
  ){
    var x = json.map((record) => ProductModel.fromJson(record)).toList();
  
    return AllProducts(x);
  }

  factory AllProducts.fromSnapshot(
    QuerySnapshot snapshot
  ) {
    var x = snapshot.docs.map((record) {
      return ProductModel.fromJson(
        record.data() as Map<String, dynamic>
      );
    }).toList();

    return AllProducts(x);
  }
}