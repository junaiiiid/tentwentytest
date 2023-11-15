/*
  Copyright (c) 2023 Junaid Tariq

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  Visit: https://www.flutterninja.com
  Email: developer@flutterninja.com
*/

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:tentwenty_test/modules/home/screens/home_screen.dart';
import 'package:tentwenty_test/modules/movie_details/screens/movie_details_screen.dart';
import 'package:tentwenty_test/modules/watch/models/popular_movies_model.dart';
import 'package:tentwenty_test/services/state_service.dart';

class RouteService {
  RouteService._();

  static GoRouter router = GoRouter(
    navigatorKey: StateService.navigatorKey,
    routes: [
      RouteNames.getRoute(
          routeName: RouteNames.homeScreen, page: const HomeScreen()),
      GoRoute(
        path: RouteNames.movieScreen,
        name: RouteNames.movie,
        builder: (context, state) {
          Result result = state.extra as Result;
          return MovieDetailsScreen(result: result);
        },
      ),
    ],
  );
}

class RouteNames {
  RouteNames._();
  static const String homeScreen = '/';
  static const String movieScreen = '/movie';
  static const String movie = 'movie';

  static GoRoute getRoute({required String routeName, required Widget page}) {
    return GoRoute(
      path: routeName,
      builder: (context, state) => page,
    );
  }
}
