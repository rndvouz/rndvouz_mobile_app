import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_garment.dart';

/// Encapsulates operations on the list of [Merchandise] returned from Firestore.
class MerchandiseCollection {
  MerchandiseCollection(merchandises) : _merchandises = merchandises;

  final List<Merchandise> _merchandises;

  Merchandise getMerchandise(String merchID) {
    return _merchandises.firstWhere((data) => data.id == merchID);
  }

  int size() {
    return _merchandises.length;
  }

  List<String> getMerchandiseIDs() {
    return _merchandises.map((data) => data.id).toList();
  }

  List<Merchandise> findByOwnerAndState(
      String owner, Availability availability) {
    return _merchandises
        .where((m) => m.ownerUsername == owner && m.state == availability)
        .toList();
  }

  List<Merchandise> loadMerchanise(Purpose purpose,
      [Garment? garment, String? owner]) {
    if (purpose == Purpose.all) {
      return _merchandises;
    } else {
      // use for searching feature
      return _merchandises.where((Merchandise m) {
        // Check if garment is provided and matches
        final garmentMatches = garment == null || m.garment == garment;
        return m.purpose == purpose && garmentMatches;
      }).toList();
    }
  }

  List<Merchandise> loadSwipeMerchandise(String currentUsername) {
    return _merchandises.where((Merchandise m) {
      return m.purpose == Purpose.browse && m.ownerUsername != currentUsername;
    }).toList();
  }
}
