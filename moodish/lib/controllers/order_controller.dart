import 'dart:async';


import 'package:midterm_app/models/formpayment_model.dart';
import 'package:midterm_app/services/services.dart';

class OrderController {
  final Services services;
  List<OrderModel> orders = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  OrderController(this.services);

  Future<List<OrderModel>> fetchOrders() async {
    onSyncController.add(true);
    orders = await services.getOrders();
    onSyncController.add(false);

    return orders;
  }
} 