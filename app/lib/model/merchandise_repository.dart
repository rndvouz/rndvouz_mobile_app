import 'package:app/model/garment.dart';
import 'package:app/model/style.dart';

import 'merchandise.dart';

class MerchandiseRepository {
  static List<Merchandise> loadMerchanise(Garment garment) {
    const allGarments = <Merchandise>[
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          // garment: Garment.top,
          garment: Garment.signup,
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
          // garment: Garment.tshirt,
          garment: Garment.signup,
          id: 002,
          merchName: "Casual Japanese Artist T-Shirt",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.jeans,
          id: 4,
          merchName: "Casual Loose Fit Ripped Jeans",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.preppy,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.skirt,
          id: 5,
          merchName: "Preppy White Skirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.chic,
          secondaryStyle: SecondaryStyle.formal,
          garment: Garment.jacket,
          id: 6,
          merchName: "Chic Khaki Coat",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.bohemeian,
          // garment: Garment.dress,
          garment: Garment.signup,
          id: 7,
          merchName: "Bohemian Flowy Summer Dress",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.bohemeian,
          secondaryStyle: SecondaryStyle.vintage,
          garment: Garment.jacket,
          id: 8,
          merchName: "Bohemian Warm Fall Outer Coat",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.hipster,
          secondaryStyle: SecondaryStyle.casual,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 9,
          merchName: "Yellow Plaid Oversized Longsleeve",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.elegant,
          secondaryStyle: SecondaryStyle.formal,
          garment: Garment.dress,
          id: 10,
          merchName: "Cute Black Elegant Button-Up Dress",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.athleisure,
          secondaryStyle: SecondaryStyle.casual,
          // garment: Garment.pants,
          garment: Garment.signup,
          id: 11,
          merchName: "Copper Athletic Pants",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.western,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 12,
          merchName: "Button-Down Patterned Longsleeve",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.edgy,
          secondaryStyle: SecondaryStyle.streetwear,
          garment: Garment.pants,
          id: 13,
          merchName: "Black Edgy Streetwear Chained Pants",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.preppy,
          secondaryStyle: SecondaryStyle.casual,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 14,
          merchName: "Cute Preppy Longsleeve with White Collar",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.edgy,
          secondaryStyle: SecondaryStyle.preppy,
          garment: Garment.skirt,
          id: 15,
          merchName: "Preppy Edgy Yellow Plaid Skirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.shorts,
          id: 16,
          merchName: "Blue Shorts",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.electic,
          secondaryStyle: SecondaryStyle.vintage,
          // garment: Garment.jacket,
          garment: Garment.signup,
          id: 17,
          merchName: "Electic Jacket",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.vintage,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 18,
          merchName: "Vintage Jacket",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.tshirt,
          id: 19,
          merchName: "Cute Casual T-Shirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.businessCasual,
          garment: Garment.longsleeve,
          id: 20,
          merchName: "Basic Business Casual Button-Down",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 21,
          merchName: "Black Casual Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.retro,
          secondaryStyle: SecondaryStyle.casual,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 22,
          merchName: "Basic Simple Retro Crewneck",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.streetwear,
          // garment: Garment.jacket,
          garment: Garment.signup,
          id: 23,
          merchName: "Black Streetwear Jacket",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.chic,
          secondaryStyle: SecondaryStyle.minimalist,
          // garment: Garment.pants,
          garment: Garment.signup,
          id: 24,
          merchName: "Black Chic Pants",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.retro,
          secondaryStyle: SecondaryStyle.vintage,
          garment: Garment.longsleeve,
          id: 25,
          merchName: "Retro Colorful Longsleeve",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 26,
          merchName: "Casual Cute Knit Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 26,
          merchName: "Casual Cute Knit Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          secondaryStyle: SecondaryStyle.minimalist,
          garment: Garment.longsleeve,
          id: 27,
          merchName: "Casual Minimal Sweater",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.tshirt,
          id: 28,
          merchName: "Casual White T-Shirt",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.classic,
          // garment: Garment.jacket,
          garment: Garment.signup,
          id: 29,
          merchName: "Classic Long Coat",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.classic,
          garment: Garment.jacket,
          id: 29,
          merchName: "Classic Long Coat",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 30,
          merchName: "Classic Cute Blue Tube Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.formal,
          secondaryStyle: SecondaryStyle.classic,
          garment: Garment.dress,
          id: 31,
          merchName: "Formal Simple Black Dress",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 32,
          merchName: "Tight-Knit Casual Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.loungewear,
          // garment: Garment.longsleeve,
          garment: Garment.signup,
          id: 33,
          merchName: "Loungewear Cream Longsleeve",
          forOnboarding: true),
      Merchandise(
          primaryStyle: PrimaryStyle.formal,
          garment: Garment.dress,
          id: 34,
          merchName: "Short Black Formal Dress",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.outdoors,
          garment: Garment.pants,
          id: 35,
          merchName: "Purple Outdoor Pants",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.streetwear,
          garment: Garment.jacket,
          id: 36,
          merchName: "Black Functional Street Jacket",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.casual,
          garment: Garment.top,
          id: 37,
          merchName: "Green Tank Top",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.formal,
          secondaryStyle: SecondaryStyle.businessCasual,
          garment: Garment.longsleeve,
          id: 38,
          merchName: "Formal White Button-Down",
          forOnboarding: false),
      Merchandise(
          primaryStyle: PrimaryStyle.streetwear,
          secondaryStyle: SecondaryStyle.casual,
          garment: Garment.tshirt,
          id: 39,
          merchName: "Dirty Yellow Street T-Shirt",
          forOnboarding: false),
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
