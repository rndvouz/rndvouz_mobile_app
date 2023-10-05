import 'package:app/model/garment.dart';
import 'package:app/model/style.dart';

import 'merchandise.dart';

class MerchandiseRepository {
  static List<Merchandise> loadMerchanise(Garment garment) {
    const allGarments = <Merchandise>[
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 000,
          merchName: "Casual Butterfly Flower Tube Top",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.classic,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.jacket,
          id: 001,
          merchName: "Cozy Beige Jacket Coat",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.edgy,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.tshirt,
          id: 002,
          merchName: "Casual Japanese Artist T-Shirt",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.jeans,
          id: 004,
          merchName: "Casual Loose Fit Ripped Jeans",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.preppy,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.skirt,
          id: 005,
          merchName: "Preppy White Skirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.chic,
          secondaryStyle: SecondaryStyle.formal,
          garment: Garment.jacket,
          id: 006,
          merchName: "Chic Khaki Coat",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.bohemeian,
          garment: Garment.dress,
          id: 007,
          merchName: "Bohemian Flowy Summer Dress",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.bohemeian,
          secondaryStyle: SecondaryStyle.vintage,
          garment: Garment.jacket,
          id: 008,
          merchName: "Bohemian Warm Fall Outer Coat",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.hipster,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.longsleeve,
          id: 009,
          merchName: "Yellow Plaid Oversized Longsleeve",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.elegant,
          secondaryStyle: SecondaryStyle.formal,
          garment: Garment.dress,
          id: 0010,
          merchName: "Cute Black Elegant Button-Up Dress",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.athleisure,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.pants,
          id: 011,
          merchName: "Copper Athletic Pants",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.western,
          garment: Garment.longsleeve,
          id: 012,
          merchName: "Button-Down Patterned Longsleeve",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.edgy,
          secondaryStyle: SecondaryStyle.streetwear,
          garment: Garment.pants,
          id: 013,
          merchName: "Black Edgy Streetwear Chained Pants",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.preppy,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.longsleeve,
          id: 014,
          merchName: "Cute Preppy Longsleeve with White Collar",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.edgy,
          secondaryStyle: SecondaryStyle.preppy,
          garment: Garment.skirt,
          id: 015,
          merchName: "Preppy Edgy Yellow Plaid Skirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.shorts,
          id: 016,
          merchName: "Blue Shorts",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.electic,
          secondaryStyle: SecondaryStyle.vintage,
          garment: Garment.jacket,
          id: 017,
          merchName: "Electic Jacket",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.vintage,
          garment: Garment.longsleeve,
          id: 018,
          merchName: "Vintage Jacket",
          forOnboarding: true),
    ];

    if (garment == Garment.all) {
      return allGarments;
    } else {
      return allGarments.where((Merchandise m) {
        return m.garment == garment;
      }).toList();
    }
  }
}
