import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/AttributeGroups.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import '../interface/JsonObject.dart';
import 'Additives.dart';
import 'Allergens.dart';
import 'EnvironmentImpactLevels.dart';
import 'Ingredient.dart';
import 'IngredientsAnalysisTags.dart';
import 'NutrientLevels.dart';
import 'Nutriments.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product extends JsonObject {
  @JsonKey(name: 'code', nullable: false)
  String barcode;
  @JsonKey(name: 'product_name', includeIfNull: false)
  String productName;
  @JsonKey(name: 'product_name_de', includeIfNull: false)
  String productNameDE;
  @JsonKey(name: 'product_name_en', includeIfNull: false)
  String productNameEN;
  @JsonKey(name: 'product_name_fr', includeIfNull: false)
  String productNameFR;
  String brands;
  @JsonKey(name: 'brands_tags', includeIfNull: false)
  List<String> brandsTags;
  @JsonKey(
      name: 'lang',
      toJson: LanguageHelper.toJson,
      fromJson: LanguageHelper.fromJson,
      includeIfNull: false)
  OpenFoodFactsLanguage lang;
  @JsonKey(includeIfNull: false)
  String quantity;
  @JsonKey(name: 'image_small_url', includeIfNull: false)
  String imgSmallUrl;
  @JsonKey(name: 'serving_size', includeIfNull: false)
  String servingSize;
  @JsonKey(
      name: 'serving_quantity', fromJson: JsonHelper.servingQuantityFromJson, includeIfNull: false)
  double servingQuantity;
  @JsonKey(name: 'product_quantity', includeIfNull: false)
  dynamic packagingQuantity;

  /// cause nesting is sooo cool ;)
  @JsonKey(
      name: 'selected_images',
      includeIfNull: false,
      fromJson: JsonHelper.selectedImagesFromJson,
      toJson: JsonHelper.selectedImagesToJson)
  List<ProductImage> selectedImages;

  @JsonKey(
      name: 'images',
      includeIfNull: false,
      fromJson: JsonHelper.imagesFromJson,
      toJson: JsonHelper.imagesToJson)
  List<ProductImage> images;

  @JsonKey(includeIfNull: false, toJson: JsonHelper.ingredientsToJson)
  List<Ingredient> ingredients;

  @JsonKey(includeIfNull: false, toJson: Nutriments.toJsonHelper)
  Nutriments nutriments;

  @JsonKey(
      name: 'additives_tags',
      includeIfNull: false,
      fromJson: Additives.additivesFromJson,
      toJson: Additives.additivesToJson)
  Additives additives;

  @JsonKey(
      name: 'environment_impact_level_tags',
      includeIfNull: false,
      fromJson: EnvironmentImpactLevels.fromJson,
      toJson: EnvironmentImpactLevels.toJson)
  EnvironmentImpactLevels environmentImpactLevels;

  @JsonKey(
      name: 'allergens_tags',
      includeIfNull: false,
      fromJson: Allergens.allergensFromJson,
      toJson: Allergens.allergensToJson)
  Allergens allergens;

  @JsonKey(
      name: 'nutrient_levels',
      includeIfNull: false,
      fromJson: NutrientLevels.fromJson,
      toJson: NutrientLevels.toJson)
  NutrientLevels nutrientLevels;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  String ingredientsText;
  @JsonKey(name: 'ingredients_text_de', includeIfNull: false)
  String ingredientsTextDE;
  @JsonKey(name: 'ingredients_text_en', includeIfNull: false)
  String ingredientsTextEN;
  @JsonKey(name: 'ingredients_text_fr', includeIfNull: false)
  String ingredientsTextFR;

  @JsonKey(
      name: 'ingredients_analysis_tags',
      includeIfNull: false,
      fromJson: IngredientsAnalysisTags.fromJson,
      toJson: IngredientsAnalysisTags.toJson)
  IngredientsAnalysisTags ingredientsAnalysisTags;

  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  String nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  String nutrimentDataPer;
  @JsonKey(name: 'nutrition_grade_fr', includeIfNull: false)
  String nutriscore;

  @JsonKey(includeIfNull: false)
  String categories;

  @JsonKey(name: 'categories_tags', includeIfNull: false)
  List<String> categoriesTags;
  @JsonKey(name: 'categories_tags_translated', includeIfNull: false)
  List<String> categoriesTagsTranslated;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String> labelsTags;
  @JsonKey(name: 'labels_tags_translated', includeIfNull: false)
  List<String> labelsTagsTranslated;
  @JsonKey(name: 'misc', includeIfNull: false)
  List<String> miscTags;
  @JsonKey(name: 'states_tags', includeIfNull: false)
  List<String> statesTags;
  @JsonKey(name: 'traces_tags', includeIfNull: false)
  List<String> tracesTags;
  @JsonKey(name: 'stores_tags', includeIfNull: false)
  List<String> storesTags;

  @JsonKey(
      name: 'attribute_groups',
      includeIfNull: false,
      fromJson: AttributeGroups.fromJson,
      toJson: AttributeGroups.toJson)
  AttributeGroups attributeGroups;

  @JsonKey(
    name: 'last_modified_t',
    includeIfNull: false,
    fromJson: JsonHelper.timestampToDate,
    toJson: JsonHelper.dateToTimestamp)
  DateTime lastModified;

  @JsonKey(name: 'ecoscore_grade', includeIfNull: false)
  String ecoscoreGrade;

  Product(
      {this.barcode,
      this.productName,
      this.productNameDE,
      this.productNameEN,
      this.productNameFR,
      this.brands,
      this.lang,
      this.quantity,
      this.imgSmallUrl,
      this.ingredientsText,
      this.ingredientsTextDE,
      this.ingredientsTextEN,
      this.categories,
      this.nutrimentEnergyUnit,
      this.nutrimentDataPer,
      this.nutriscore,
      this.nutriments,
      this.additives,
      this.nutrientLevels,
      this.servingSize,
      this.servingQuantity,
      this.ecoscoreGrade});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
