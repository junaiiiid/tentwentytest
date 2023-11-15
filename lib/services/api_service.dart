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

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:tentwenty_test/constants/api_constants.dart';
import 'package:tentwenty_test/modules/watch/models/backdrop_model.dart';
import 'package:tentwenty_test/modules/watch/models/genre_model.dart';
import 'package:tentwenty_test/modules/watch/models/popular_movies_model.dart';
import 'package:tentwenty_test/services/logger_service.dart';

class APIService {
  APIService._();

  static final _dio = Dio();

  static Future<GenreModel?> getMovieGenres() async {
    try {
      final response = await _dio.get(
        APIConstants.getMovieGenre,
        options: Options(headers: APIConstants.headers),
      );

      if (response.statusCode == 200) {
        return GenreModel.fromJson(response.data['genres']);
      } else {
        LoggerService.logger.e('Failed to load genres');
      }
    } catch (error) {
      LoggerService.logger.e('Error: $error');
    }
  }

  static Future<BackDropsModel?> getMovieBackDrops({required int id}) async {
    final String url =
        APIConstants.getMovieBackdrop.replaceAll("ID", id.toString());

    try {
      final response = await _dio.get(
        url,
        options: Options(headers: APIConstants.headers),
      );

      if (response.statusCode == 200) {
        return BackDropsModel.fromJson(response.data);
      } else {
        LoggerService.logger.e('Failed to load backdrops');
      }
    } catch (error) {
      LoggerService.logger.e('Error with id $id : $error');
    }
  }

  static Future<PopularMoviesModel?> getPopularMovies() async {
    try {
      final response = await _dio.get(
        APIConstants.getPopularMovies,
        options: Options(headers: APIConstants.headers),
      );

      if (response.statusCode == 200) {
        return PopularMoviesModel.fromJson(response.data);
      } else {
        LoggerService.logger.e('Failed to load backdrops');
      }
    } catch (error) {
      LoggerService.logger.e('Error: $error');
    }
  }

  static Future<PopularMoviesModel?> searchMovie(
      {required String searchTerm}) async {
    try {
      final response = await _dio.get(
        "${APIConstants.searchMovies}$searchTerm",
        options: Options(headers: APIConstants.headers),
      );

      if (response.statusCode == 200) {
        return PopularMoviesModel.fromJson(response.data);

      } else {
        LoggerService.logger.e('Failed to load backdrops');
      }
    } catch (error) {
      LoggerService.logger.e('Error: $error');
    }
  }
}
