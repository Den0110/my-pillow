// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../models/articles/article.dart' as _i8;
import '../pages/articles/articles_page.dart' as _i4;
import '../pages/articles/wiki_article/wiki_article_page.dart' as _i3;
import '../pages/home/home_page.dart' as _i2;
import '../pages/main/main_page.dart' as _i1;
import '../pages/statistics/statistics_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    WikiArticleRoute.name: (routeData) {
      final args = routeData.argsAs<WikiArticleRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WikiArticlePage(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ArticlesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ArticlesPage(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.StatisticsPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              WikiArticleRoute.name,
              path: 'wiki-article-page',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              ArticlesRoute.name,
              path: 'articles-page',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              StatisticsRoute.name,
              path: 'statistics-page',
              parent: MainRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.WikiArticlePage]
class WikiArticleRoute extends _i6.PageRouteInfo<WikiArticleRouteArgs> {
  WikiArticleRoute({
    _i7.Key? key,
    required _i8.Article article,
  }) : super(
          WikiArticleRoute.name,
          path: 'wiki-article-page',
          args: WikiArticleRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'WikiArticleRoute';
}

class WikiArticleRouteArgs {
  const WikiArticleRouteArgs({
    this.key,
    required this.article,
  });

  final _i7.Key? key;

  final _i8.Article article;

  @override
  String toString() {
    return 'WikiArticleRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i4.ArticlesPage]
class ArticlesRoute extends _i6.PageRouteInfo<void> {
  const ArticlesRoute()
      : super(
          ArticlesRoute.name,
          path: 'articles-page',
        );

  static const String name = 'ArticlesRoute';
}

/// generated route for
/// [_i5.StatisticsPage]
class StatisticsRoute extends _i6.PageRouteInfo<void> {
  const StatisticsRoute()
      : super(
          StatisticsRoute.name,
          path: 'statistics-page',
        );

  static const String name = 'StatisticsRoute';
}
