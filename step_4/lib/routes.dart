import 'package:flutter/material.dart';
import 'package:kitchen_story/api.dart';
import 'package:kitchen_story/home_page.dart';
import 'package:kitchen_story/main.dart';
import 'package:kitchen_story/models.dart';
import 'package:kitchen_story/recipe_detail_page.dart';

enum AppRoutes { HOME, DETAIL, ERROR }

class AppConfiguration {
  late AppRoutes route;
  late Map<String, dynamic> arguments;

  AppConfiguration(
      {this.route = AppRoutes.HOME, Map<String, dynamic>? arguments}) {
    this.arguments = arguments ?? {};
  }

  AppConfiguration.home() {
    route = AppRoutes.HOME;
    arguments = {};
  }

  AppConfiguration.detail({required int id}) {
    route = AppRoutes.DETAIL;
    arguments = {"id": id};
  }

  AppConfiguration.unknown() {
    route = AppRoutes.ERROR;
    arguments = {};
  }

  bool get isKnown {
    return route != AppRoutes.ERROR;
  }
}

class AppRouteInformationParser
    extends RouteInformationParser<AppConfiguration> {
  @override
  Future<AppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    var uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return AppConfiguration.home();
    } else if (uri.pathSegments.length == 2 &&
        uri.pathSegments[0] == "recipe") {
      var payload = uri.pathSegments[1];
      var id = int.tryParse(payload);
      if (id != null) {
        return AppConfiguration.detail(id: id);
      }
    }

    return AppConfiguration.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(AppConfiguration configuration) {
    if (!configuration.isKnown) {
      return RouteInformation(location: "/404");
    }
    if (configuration.route == AppRoutes.HOME) {
      return RouteInformation(location: "/");
    }
    if (configuration.route == AppRoutes.DETAIL) {
      return RouteInformation(
          location: '/recipe/${configuration.arguments['id']}');
    }
    return null;
  }
}

class AppRouterDelegate extends RouterDelegate<AppConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfiguration> {
  final GlobalKey<NavigatorState> navigatorKey;

  KitchenService _kitchenService = KitchenService();
  RecipeModel? _selectedRecipe;

  List<RecipeModel> recipes = [];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppConfiguration get currentConfiguration {
    return _selectedRecipe == null
        ? AppConfiguration.home()
        : AppConfiguration.detail(id: _selectedRecipe!.id);
  }

  void _handleRecipeTap(RecipeModel model) {
    _selectedRecipe = model;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey('HomePage'),
            child: MyHomePage(
              title: 'Kitchen story',
              recipes: recipes,
              onTapped: _handleRecipeTap,
            )),
        if (_selectedRecipe != null) DetailPage(recipe: _selectedRecipe!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedRecipe = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppConfiguration configuration) async {
    if (!configuration.isKnown) {
      _selectedRecipe = null;
      return;
    }

    if (configuration.route == AppRoutes.DETAIL) {
      if (configuration.arguments['id'] < 0 ||
          configuration.arguments['id'] > recipes.length - 1) {
        return;
      }
      _selectedRecipe = recipes[configuration.arguments['id']];
    } else {
      _selectedRecipe = null;
      var recommendation = await _kitchenService.loadRecommendations();
      recipes = recommendation.recommendations;
      notifyListeners();
    }
  }
}
