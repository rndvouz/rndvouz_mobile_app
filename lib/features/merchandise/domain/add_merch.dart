import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rndvouz/features/common/domain/measurements.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_garment.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_style.dart';

void AddMerch() {
  final db = FirebaseFirestore.instance.collection("merchandise");

  final newDoc = db.doc();
  final newDoc2 = db.doc();

  Merchandise newMerch = Merchandise(
    id: newDoc.id,
    ownerUsername: "sdfgdfg",
    purpose: Purpose.setup,
    primaryStyle: PrimaryStyle.casual,
    garment: Garment.top,
    merchColors: {MerchColors.green},
    merchName: "Casual Butterfly Flower Tube Top",
    merchMeasurements: Measurements(
      bust: 20.0,
    ),
    sellingMethod: SellingMethod.selling,
    price: 7,
    likes: 40,
    state: Availability.selling,
  );

  newDoc.set(newMerch.toJson());
  newDoc2.set(newMerch.toJson());
}
