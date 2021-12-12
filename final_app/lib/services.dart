import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/transaction_model.dart';



abstract class Services {
  Future<List<TransModel>> getTrans();
}

class FirebaseServices extends Services {
  @override

  Future<List<TransModel>> getTrans() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore
        .instance
        .collection('mind_final')
        .get();

    var all = AllTrans.fromSnapshot(snapshot);

    return all.trans;
  }
}
