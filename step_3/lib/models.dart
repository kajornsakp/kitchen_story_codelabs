class Recommendation {
  final List<RecipeModel> recommendations;

  Recommendation({required this.recommendations});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    var recommendationsList = json['recommendations'] as List;

    List<RecipeModel> recommendations =
        recommendationsList.map((i) => RecipeModel.fromJson(i)).toList();

    return Recommendation(recommendations: recommendations);
  }
}

class Categories {
  final List<CategoryModel> categories;

  Categories({required this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) {
    var categoriesList = json['categories'] as List;

    List<CategoryModel> categories =
        categoriesList.map((i) => CategoryModel.fromJson(i)).toList();

    return Categories(categories: categories);
  }
}

class CategoryModel {
  final int id;
  final String category;
  final int amount;

  CategoryModel(
      {required this.id, required this.category, required this.amount});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], category: json['category'], amount: json['amount']);
  }
}

class RecipeModel {
  final int id;
  final String imgUrl;
  final String name;
  final String chefName;
  final int totalCookingTime;
  final RatingModel rating;
  final CookingTimeModel cookingTime;
  final List<String> ingredients;
  final List<CookingStepModel> steps;

  RecipeModel(
      {required this.id,
      required this.imgUrl,
      required this.name,
      required this.chefName,
      required this.totalCookingTime,
      required this.rating,
      required this.cookingTime,
      required this.ingredients,
      required this.steps});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    var ingredientsList = new List<String>.from(json['ingredients']);
    var stepsList = json['steps'] as List;

    List<CookingStepModel> cookingSteps =
        stepsList.map((i) => CookingStepModel.fromJson(i)).toList();

    return RecipeModel(
        id: json['id'],
        imgUrl: json['imgUrl'],
        name: json['name'],
        chefName: json['chefName'],
        totalCookingTime: json['totalCookingTime'],
        rating: RatingModel.fromJson(json['rating']),
        cookingTime: CookingTimeModel.fromJson(json['cookingTime']),
        ingredients: ingredientsList,
        steps: cookingSteps);
  }
}

class RatingModel {
  final int rating;
  final String difficulty;
  final String color;

  RatingModel(
      {required this.rating, required this.difficulty, required this.color});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
        rating: json['rating'],
        difficulty: json['difficulty'],
        color: json['color']);
  }
}

class CookingTimeModel {
  final int prepareTime;
  final int inactiveTime;
  final int cookTime;

  CookingTimeModel(
      {required this.prepareTime,
      required this.inactiveTime,
      required this.cookTime});

  factory CookingTimeModel.fromJson(Map<String, dynamic> json) {
    return CookingTimeModel(
        prepareTime: json['prepareTime'],
        inactiveTime: json['inactiveTime'],
        cookTime: json['cookTime']);
  }
}

class CookingStepModel {
  final int step;
  final String instruction;

  CookingStepModel({required this.step, required this.instruction});

  factory CookingStepModel.fromJson(Map<String, dynamic> json) {
    return CookingStepModel(
        step: json['step'], instruction: json['instruction']);
  }
}
