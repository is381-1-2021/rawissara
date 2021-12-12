import 'dart:async';

import 'package:final_app/model/transaction_model.dart';
import 'package:final_app/services.dart';


class TransController {
  final Services services;
  List<TransModel> trans = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TransController(this.services);

  Future<List<TransModel>> fetchTrans() async {
    onSyncController.add(true);
    trans = await services.getTrans();
    onSyncController.add(false);

    return trans;
  }
}
