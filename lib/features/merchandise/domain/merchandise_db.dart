import 'package:rndvouz/features/common/domain/measurements.dart';
import 'package:flutter/foundation.dart';

import 'merchandise_garment.dart';
import 'merchandise.dart';
import 'merchandise_style.dart';

class MerchandiseDB {
  List<Merchandise> allGarments = <Merchandise>[
    Merchandise(
      id: 0,
      ownerUsername: "thusgranola",
      state: Availability.selling,
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
    ),
    Merchandise(
      id: 1,
      ownerUsername: "premiumtranquil",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.classic,
      garment: Garment.jacket,
      merchColors: {MerchColors.black, MerchColors.white},
      merchName: "Black Jacket Vest",
      merchMeasurements: Measurements(
        bust: 25.0,
        waist: 28.0,
        sleeveLength: 30.0,
        length: 60.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 40,
    ),
    Merchandise(
      id: 2,
      ownerUsername: "ceremoniousultra",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.edgy,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.tshirt,
      merchColors: {MerchColors.beige},
      merchName: "Cozy Beige Jacket",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 63.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 80,
    ),
    Merchandise(
      id: 3,
      ownerUsername: "pokesteam",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.edgy,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.tshirt,
      merchColors: {MerchColors.black, MerchColors.white},
      merchName: "White Japanese Art T-Shirt",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 40.0,
        length: 57.0,
        sleeveLength: 15.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 5,
      likes: 40,
    ),
    Merchandise(
      id: 4,
      ownerUsername: "foreverbento",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.jeans,
      merchColors: {MerchColors.blue},
      merchName: "Casual Loose Fit Ripped Jeans",
      merchMeasurements: Measurements(
        waist: 33.0,
        hips: 38.0,
        inseam: 7.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 16,
      likes: 40,
    ),
    Merchandise(
      id: 5,
      ownerUsername: "serioussyrup",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.preppy,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.skirt,
      merchColors: {MerchColors.white},
      merchName: "Preppy White Skirt",
      merchMeasurements: Measurements(
        waist: 29.0,
        hips: 32.0,
        length: 40.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 6,
      ownerUsername: "zealdirty",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.chic,
      secondaryStyle: SecondaryStyle.formal,
      garment: Garment.jacket,
      merchColors: {MerchColors.tan},
      merchName: "Chic Khaki Coat",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 90.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 22,
      likes: 41,
    ),
    Merchandise(
      id: 7,
      ownerUsername: "disfiguredlapis",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.bohemeian,
      garment: Garment.dress,
      merchColors: {MerchColors.blue, MerchColors.orange, MerchColors.beige},
      merchName: "Bohemian Flowy Summer Dress",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 25.0,
        hips: 30.0,
        length: 65.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 13,
      likes: 64,
    ),
    Merchandise(
      id: 8,
      ownerUsername: "decoratecow",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.bohemeian,
      secondaryStyle: SecondaryStyle.vintage,
      garment: Garment.jacket,
      merchColors: {MerchColors.tan, MerchColors.brown},
      merchName: "Bohemian Warm Fall Outer Coat",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 90.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 9,
      ownerUsername: "glasssoulful",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.hipster,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.yellow, MerchColors.black},
      merchName: "Yellow Plaid Oversized Longsleeve",
      merchMeasurements: Measurements(
        sleeveLength: 40.0,
        length: 50.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 77,
    ),
    Merchandise(
      id: 10,
      ownerUsername: "representbulky",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.elegant,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.dress,
      merchColors: {MerchColors.black},
      merchName: "Cute Black Elegant Button-Up Dress",
      merchMeasurements: Measurements(
        bust: 22.0,
        waist: 25.0,
        hips: 30.0,
        length: 61.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 20,
    ),
    Merchandise(
      id: 11,
      ownerUsername: "parmesandamage",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.athleisure,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.pants,
      merchColors: {MerchColors.orange},
      merchName: "Copper Athletic Pants",
      merchMeasurements: Measurements(
        waist: 27.0,
        hips: 31.3,
        inseam: 6.2,
        length: 69.1,
      ),
      sellingMethod: SellingMethod.selling,
      price: 23,
      likes: 40,
    ),
    Merchandise(
      id: 12,
      ownerUsername: "kayakermotherly",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.western,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.brown, MerchColors.yellow},
      merchName: "Button-Down Patterned Longsleeve",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 13,
      ownerUsername: "chickendistraught",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.edgy,
      secondaryStyle: SecondaryStyle.streetwear,
      garment: Garment.pants,
      merchColors: {MerchColors.black},
      merchName: "Black Edgy Streetwear Chained Pants",
      merchMeasurements: Measurements(
        waist: 27.0,
        hips: 31.3,
        inseam: 6.2,
        length: 70.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 40,
    ),
    Merchandise(
      id: 14,
      ownerUsername: "cobrawinter",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.preppy,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.black, MerchColors.white},
      merchName: "Cute Preppy Longsleeve with White Collar",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 8,
      likes: 40,
    ),
    Merchandise(
      id: 15,
      ownerUsername: "disneymarvel",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.preppy,
      garment: Garment.skirt,
      merchColors: {MerchColors.yellow, MerchColors.black},
      merchName: "Preppy Edgy Yellow Plaid Skirt",
      merchMeasurements: Measurements(
        waist: 28.0,
        hips: 31.0,
        length: 41.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 7.5,
      likes: 40,
    ),
    Merchandise(
      id: 16,
      ownerUsername: "guffawballoon",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.shorts,
      merchName: "Blue Shorts",
      merchColors: {MerchColors.blue},
      merchMeasurements: Measurements(
        waist: 28.0,
        hips: 31.0,
        length: 24.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 5,
    ),
    Merchandise(
      id: 17,
      ownerUsername: "markpantheon",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.electic,
      secondaryStyle: SecondaryStyle.vintage,
      garment: Garment.jacket,
      merchName: "Electic Jacket",
      merchColors: {MerchColors.green, MerchColors.orange, MerchColors.yellow},
      merchMeasurements: Measurements(
        bust: 21.0,
        waist: 32.0,
        sleeveLength: 32.0,
        length: 50.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 10,
      likes: 41,
    ),
    Merchandise(
      id: 18,
      ownerUsername: "disfiguredlapis",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.vintage,
      secondaryStyle: SecondaryStyle.casual,
      garment: Garment.jacket,
      merchColors: {
        MerchColors.white,
        MerchColors.blue,
        MerchColors.green,
        MerchColors.orange
      },
      merchName: "Vintage Jacket",
      merchMeasurements: Measurements(
        bust: 22.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 72.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 24,
      likes: 40,
    ),
    Merchandise(
      id: 19,
      ownerUsername: "yearningsaid",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.tshirt,
      merchColors: {MerchColors.white},
      merchName: "Cute Casual T-Shirt",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 40.0,
        length: 57.0,
        sleeveLength: 15.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 20,
      ownerUsername: "ceremoniousultra",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.businessCasual,
      merchColors: {MerchColors.blue},
      garment: Garment.longsleeve,
      merchName: "Basic Business Casual Button-Down",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 17,
      likes: 42,
    ),
    Merchandise(
      id: 21,
      ownerUsername: "pokesteam",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.top,
      merchColors: {MerchColors.black},
      merchName: "Black Casual Top",
      merchMeasurements: Measurements(
        bust: 20.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 6.5,
      likes: 0,
    ),
    Merchandise(
      id: 22,
      ownerUsername: "serioussyrup",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.black},
      merchName: "Basic Simple Retro Crewneck",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 34,
      likes: 89,
    ),
    Merchandise(
      id: 23,
      ownerUsername: "zealdirty",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.streetwear,
      garment: Garment.jacket,
      merchColors: {MerchColors.black},
      merchName: "Black Streetwear Jacket",
      merchMeasurements: Measurements(
        bust: 22.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 72.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 57.9,
      likes: 8,
    ),
    Merchandise(
      id: 24,
      ownerUsername: "disfiguredlapis",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.minimalist,
      garment: Garment.pants,
      merchColors: {MerchColors.black},
      merchName: "Black Chic Pants",
      merchMeasurements: Measurements(
        waist: 27.0,
        hips: 31.3,
        inseam: 6.2,
        length: 70.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 25,
      ownerUsername: "foreverbento",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.retro,
      secondaryStyle: SecondaryStyle.vintage,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.white, MerchColors.blue, MerchColors.green},
      merchName: "Retro Colorful Longsleeve",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 12,
      likes: 40,
    ),
    Merchandise(
      id: 26,
      ownerUsername: "foreverbento",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.top,
      merchColors: {MerchColors.green},
      merchName: "Casual Cute Green Knit Top",
      merchMeasurements: Measurements(
        bust: 20.0,
        waist: 40.0,
        length: 34.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 27,
      ownerUsername: "thusgranola",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      secondaryStyle: SecondaryStyle.minimalist,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.beige},
      merchName: "Casual Minimal Sweater",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 20,
      likes: 40,
    ),
    Merchandise(
      id: 28,
      ownerUsername: "parmesandamage",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.tshirt,
      merchColors: {MerchColors.white},
      merchName: "Casual White T-Shirt",
      merchMeasurements: Measurements(
        waist: 40.0,
        length: 57.0,
        sleeveLength: 15.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 40,
    ),
    Merchandise(
      id: 29,
      ownerUsername: "foreverbento",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.classic,
      garment: Garment.jacket,
      merchColors: {MerchColors.green},
      merchName: "Classic Long Coat",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 34.0,
        sleeveLength: 30.0,
        length: 90.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 24.4,
      likes: 41,
    ),
    Merchandise(
      id: 30,
      ownerUsername: "foreverbento",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.top,
      merchColors: {MerchColors.blue, MerchColors.white},
      merchName: "Classic Cute Blue Tub Top",
      merchMeasurements: Measurements(
        waist: 40.0,
        length: 57.0,
        sleeveLength: 15.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 7,
    ),
    Merchandise(
      id: 31,
      ownerUsername: "guffawballoon",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.formal,
      secondaryStyle: SecondaryStyle.classic,
      garment: Garment.dress,
      merchColors: {MerchColors.black},
      merchName: "Formal Simple Black Dress",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 25.0,
        hips: 30.0,
        length: 65.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 10,
      likes: 40,
    ),
    Merchandise(
      id: 32,
      ownerUsername: "disfiguredlapis",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.top,
      merchColors: {MerchColors.purple},
      merchName: "Tight-Knite Casual Top",
      merchMeasurements: Measurements(
        bust: 20.0,
        waist: 40.0,
        length: 33.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 40,
    ),
    Merchandise(
      id: 33,
      ownerUsername: "premiumtranquil",
      state: Availability.selling,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.loungewear,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.white},
      merchName: "Loungewear Cream Longsleeve",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 7,
      likes: 40,
    ),
    Merchandise(
      id: 34,
      ownerUsername: "decoratecow",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.formal,
      garment: Garment.dress,
      merchColors: {MerchColors.black},
      merchName: "Short Black Formal Dress",
      merchMeasurements: Measurements(
        bust: 24.0,
        waist: 25.0,
        hips: 30.0,
        length: 65.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 17,
      likes: 6,
    ),
    Merchandise(
      id: 35,
      ownerUsername: "kayakermotherly",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.outdoors,
      garment: Garment.pants,
      merchColors: {MerchColors.purple},
      merchName: "Purple Outdoor Pants",
      merchMeasurements: Measurements(
        waist: 27.0,
        hips: 31.3,
        inseam: 6.2,
        length: 73.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 19,
      likes: 21,
    ),
    Merchandise(
      id: 36,
      ownerUsername: "thusgranola",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.streetwear,
      garment: Garment.jacket,
      merchColors: {MerchColors.black},
      merchName: "Black Functional Street Jacket",
      merchMeasurements: Measurements(
        bust: 25.0,
        waist: 28.0,
        sleeveLength: 30.0,
        length: 60.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 40,
    ),
    Merchandise(
      id: 37,
      ownerUsername: "representbulky",
      state: Availability.selling,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.casual,
      garment: Garment.top,
      merchColors: {MerchColors.green},
      merchName: "Green Tank Top",
      merchMeasurements: Measurements(
        waist: 40.0,
        length: 57.0,
      ),
      sellingMethod: SellingMethod.selling,
      price: 6,
      likes: 40,
    ),
    Merchandise(
      id: 38,
      ownerUsername: "premiumtranquil",
      state: Availability.sold,
      purpose: Purpose.browse,
      primaryStyle: PrimaryStyle.businessCasual,
      garment: Garment.longsleeve,
      merchColors: {MerchColors.white},
      merchName: "Formal White Button-Down",
      merchMeasurements: Measurements(
        sleeveLength: 42.0,
        length: 48.0,
      ),
      sellingMethod: SellingMethod.negotiate,
      priceRange: PriceRange(
        minPrice: 12.0,
        maxPrice: 15.0,
      ),
      likes: 5,
    ),
    Merchandise(
      id: 39,
      ownerUsername: "thusgranola",
      state: Availability.sold,
      purpose: Purpose.setup,
      primaryStyle: PrimaryStyle.streetwear,
      garment: Garment.tshirt,
      merchColors: {MerchColors.yellow},
      merchName: "Dirty Mustard Yellow Street T-Shirt",
      merchMeasurements: Measurements(
        waist: 40.0,
        length: 57.0,
        sleeveLength: 15.0,
      ),
      sellingMethod: SellingMethod.trading,
      desiredTrade: "Vintage Doc Marins",
      likes: 25,
    ),
  ];

  List<Merchandise> findByOwnerAndState(
      String owner, Availability availability) {
    return allGarments
        .where((m) => m.ownerUsername == owner && m.state == availability)
        .toList();
  }

  List<Merchandise> loadMerchanise(Purpose purpose,
      [Garment? garment, String? owner]) {
    if (purpose == Purpose.all) {
      return this.allGarments;
    } else {
      // use for searching feature
      return allGarments.where((Merchandise m) {
        return m.purpose == purpose;
      }).toList();
    }
  }
}

MerchandiseDB merchandiseDB = MerchandiseDB();
