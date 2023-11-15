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

class PopularMoviesModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  PopularMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((resultJson) => Result.fromJson(resultJson))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String? originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? "",
      genreIds: (json['genre_ids'] as List<dynamic>).cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      overview: json['overview'] ?? "",
      popularity: json['popularity'] ?? 0.0,
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'] ?? "",
      title: json['title'] ?? "",
      video: json['video'] ?? false,
      voteAverage: json['vote_average'] ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
