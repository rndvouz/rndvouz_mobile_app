// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchandise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchandiseImpl _$$MerchandiseImplFromJson(Map<String, dynamic> json) =>
    _$MerchandiseImpl(
      id: json['id'] as String,
      owner: json['owner'] as String,
      availability: $enumDecode(_$AvailabilityEnumMap, json['availability']),
      purpose: $enumDecode(_$PurposeEnumMap, json['purpose']),
      primaryStyle: $enumDecode(_$PrimaryStyleEnumMap, json['primaryStyle']),
      secondaryStyle:
          $enumDecodeNullable(_$SecondaryStyleEnumMap, json['secondaryStyle']),
      garment: $enumDecode(_$GarmentEnumMap, json['garment']),
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MerchColorsEnumMap, e))
          .toSet(),
      title: json['title'] as String,
      measurements:
          Measurements.fromJson(json['measurements'] as Map<String, dynamic>),
      sellingMethod: $enumDecode(_$SellingMethodEnumMap, json['sellingMethod']),
      price: (json['price'] as num).toDouble(),
      priceRange: const PriceRangeConverter()
          .fromJson(json['priceRange'] as Map<String, dynamic>?),
      desiredTrade: json['desiredTrade'] as String?,
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$$MerchandiseImplToJson(_$MerchandiseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'availability': _$AvailabilityEnumMap[instance.availability]!,
      'purpose': _$PurposeEnumMap[instance.purpose]!,
      'primaryStyle': _$PrimaryStyleEnumMap[instance.primaryStyle]!,
      'secondaryStyle': _$SecondaryStyleEnumMap[instance.secondaryStyle],
      'garment': _$GarmentEnumMap[instance.garment]!,
      'colors': instance.colors?.map((e) => _$MerchColorsEnumMap[e]!).toList(),
      'title': instance.title,
      'measurements': instance.measurements,
      'sellingMethod': _$SellingMethodEnumMap[instance.sellingMethod]!,
      'price': instance.price,
      'priceRange': const PriceRangeConverter().toJson(instance.priceRange),
      'desiredTrade': instance.desiredTrade,
      'likes': instance.likes,
    };

const _$AvailabilityEnumMap = {
  Availability.selling: 'selling',
  Availability.sold: 'sold',
};

const _$PurposeEnumMap = {
  Purpose.setup: 'setup',
  Purpose.browse: 'browse',
  Purpose.all: 'all',
};

const _$PrimaryStyleEnumMap = {
  PrimaryStyle.athleisure: 'athleisure',
  PrimaryStyle.bohemeian: 'bohemeian',
  PrimaryStyle.businessCasual: 'businessCasual',
  PrimaryStyle.casual: 'casual',
  PrimaryStyle.chic: 'chic',
  PrimaryStyle.classic: 'classic',
  PrimaryStyle.contemporary: 'contemporary',
  PrimaryStyle.western: 'western',
  PrimaryStyle.electic: 'electic',
  PrimaryStyle.edgy: 'edgy',
  PrimaryStyle.elegant: 'elegant',
  PrimaryStyle.formal: 'formal',
  PrimaryStyle.gothic: 'gothic',
  PrimaryStyle.hipster: 'hipster',
  PrimaryStyle.loungewear: 'loungewear',
  PrimaryStyle.minimalist: 'minimalist',
  PrimaryStyle.modern: 'modern',
  PrimaryStyle.outdoors: 'outdoors',
  PrimaryStyle.preppy: 'preppy',
  PrimaryStyle.retro: 'retro',
  PrimaryStyle.rocker: 'rocker',
  PrimaryStyle.streetwear: 'streetwear',
  PrimaryStyle.vintage: 'vintage',
};

const _$SecondaryStyleEnumMap = {
  SecondaryStyle.athleisure: 'athleisure',
  SecondaryStyle.bohemeian: 'bohemeian',
  SecondaryStyle.businessCasual: 'businessCasual',
  SecondaryStyle.casual: 'casual',
  SecondaryStyle.chic: 'chic',
  SecondaryStyle.classic: 'classic',
  SecondaryStyle.contemporary: 'contemporary',
  SecondaryStyle.western: 'western',
  SecondaryStyle.electic: 'electic',
  SecondaryStyle.edgy: 'edgy',
  SecondaryStyle.elegant: 'elegant',
  SecondaryStyle.formal: 'formal',
  SecondaryStyle.gothic: 'gothic',
  SecondaryStyle.hipster: 'hipster',
  SecondaryStyle.loungewear: 'loungewear',
  SecondaryStyle.minimalist: 'minimalist',
  SecondaryStyle.modern: 'modern',
  SecondaryStyle.outdoors: 'outdoors',
  SecondaryStyle.preppy: 'preppy',
  SecondaryStyle.retro: 'retro',
  SecondaryStyle.rocker: 'rocker',
  SecondaryStyle.streetwear: 'streetwear',
  SecondaryStyle.vintage: 'vintage',
};

const _$GarmentEnumMap = {
  Garment.shirt: 'shirt',
  Garment.top: 'top',
  Garment.blouse: 'blouse',
  Garment.longsleeve: 'longsleeve',
  Garment.jeans: 'jeans',
  Garment.pants: 'pants',
  Garment.shorts: 'shorts',
  Garment.skirt: 'skirt',
  Garment.jacket: 'jacket',
  Garment.hoodie: 'hoodie',
  Garment.dress: 'dress',
  Garment.sneakers: 'sneakers',
  Garment.slippers: 'slippers',
  Garment.boots: 'boots',
  Garment.accessories: 'accessories',
};

const _$MerchColorsEnumMap = {
  MerchColors.red: 'red',
  MerchColors.orange: 'orange',
  MerchColors.yellow: 'yellow',
  MerchColors.green: 'green',
  MerchColors.blue: 'blue',
  MerchColors.indigo: 'indigo',
  MerchColors.purple: 'purple',
  MerchColors.gray: 'gray',
  MerchColors.black: 'black',
  MerchColors.white: 'white',
  MerchColors.brown: 'brown',
  MerchColors.tan: 'tan',
  MerchColors.beige: 'beige',
};

const _$SellingMethodEnumMap = {
  SellingMethod.selling: 'selling',
  SellingMethod.negotiate: 'negotiate',
  SellingMethod.trading: 'trading',
};

_$PriceRangeImpl _$$PriceRangeImplFromJson(Map<String, dynamic> json) =>
    _$PriceRangeImpl(
      minPrice: (json['minPrice'] as num).toDouble(),
      maxPrice: (json['maxPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$PriceRangeImplToJson(_$PriceRangeImpl instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
