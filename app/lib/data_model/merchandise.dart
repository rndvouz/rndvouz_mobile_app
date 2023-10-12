import 'measurements.dart';
import 'merchandise_garment.dart';
import 'merchandise_style.dart';

enum Availability { selling, sold }

enum SellingMethod { selling, negotiate, trading }

enum MerchColors {
  red,
  orange,
  yellow,
  green,
  blue,
  indigo,
  purple,
  gray,
  black,
  white,
  brown,
  tan,
  beige
}

class Merchandise {
  final int id;
  final String ownerUsername;
  final State state;
  // final bool forOnboarding;
  final PrimaryStyle primaryStyle;
  final SecondaryStyle? secondaryStyle;
  final Garment garment;
  final Set<MerchColors> merchColors;
  final String merchName;
  final Measurements merchMeasurements;
  final SellingMethod sellingMethod;
  final int price; // for selling
  final PriceRange? priceRange; // for negotiating
  final String? desiredTrade; // for trading
  final int likes;

  Merchandise({
    required this.id,
    required this.ownerUsername,
    required this.state,
    // required this.forOnboarding
    required this.primaryStyle,
    this.secondaryStyle,
    required this.garment,
    required this.merchColors,
    required this.merchName,
    required this.merchMeasurements,
    required this.sellingMethod,
    this.price = 0,
    this.priceRange, // default null
    this.desiredTrade, // default null
    this.likes = 0, // default value
  });

  String get assetId => '$id.jpg';
  String get assetImages => 'assets/images/$id';

  @override
  String toString() => '$merchName (id=$id)';
}

class PriceRange {
  final int minPrice;
  final int maxPrice;

  const PriceRange({required this.minPrice, required this.maxPrice});
}

class MerchandiseGenerator {
  static List<Merchandise> generateMerchandiseList(
      List<Merchandise> existingList) {
    final List<Merchandise> newMerchandiseList = [];

    final List<String> usernames = ['test', 'amyw', 'sams'];
    final List<State> states = [State.selling, State.selling, State.sold];
    SecondaryStyle? secondaryStyle;
    final List<int> prices = [
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      23,
      25,
      30,
      40,
      50
    ];

    final List<SellingMethod> sellingMethods = [
      SellingMethod.selling,
      SellingMethod.negotiate,
      SellingMethod.trading
    ];

    for (int i = 0; i < existingList.length; i++) {
      final username = usernames[i % 3];
      final state = states[i % 3];
      final primaryStyle = existingList[i].primaryStyle;
      if (existingList[i].secondaryStyle != null) {
        secondaryStyle = existingList[i].secondaryStyle;
      }
      final garment = existingList[i].garment;
      final likes = i * 5;
      final measurements = Measurements(
        bust: 30.0 + i * 2.0,
        waist: 25.0 + i * 2.0,
        hips: 35.0 + i * 2.0,
        inseam: 28.0 + i * 2.0,
        sleeveLength: 24.0 + i * 2.0,
      );
      final sellingMethod = sellingMethods[i % 3];
      final price = prices[i % prices.length];

      final merchandise = Merchandise(
        id: i,
        ownerUsername: username,
        state: state,
        primaryStyle: primaryStyle,
        secondaryStyle: secondaryStyle,
        garment: garment,
        likes: likes,
        merchColors: existingList[i].merchColors,
        merchName: existingList[i].merchName,
        merchMeasurements: measurements,
        sellingMethod: sellingMethod,
        price: price,
      );

      newMerchandiseList.add(merchandise);
    }

    return newMerchandiseList;
  }
}
