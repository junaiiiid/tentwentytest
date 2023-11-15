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

// Project imports:
import 'package:tentwenty_test/architecture/base_view_model.dart';
import 'package:tentwenty_test/constants/api_constants.dart';
import 'package:tentwenty_test/modules/watch/models/backdrop_model.dart';
import 'package:tentwenty_test/modules/watch/models/genre_model.dart';
import 'package:tentwenty_test/modules/watch/models/popular_movies_model.dart';
import 'package:tentwenty_test/services/api_service.dart';

class WatchViewModel extends BaseViewModel {
  SearchBarState _searchBarState = SearchBarState.inActive;

  SearchBarState get searchBarState => _searchBarState;

  set searchBarState(SearchBarState value) {
    _searchBarState = value;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  List<String> imageURLs = [];

  PopularMoviesModel _searchQueryModel =
      PopularMoviesModel(page: 0, results: [], totalPages: 0, totalResults: 0);

  PopularMoviesModel get searchQueryModel => _searchQueryModel;

  set searchQueryModel(PopularMoviesModel value) {
    _searchQueryModel = value;
    notifyListeners();
  }

  GenreModel _genreModel = GenreModel(genres: []);

  GenreModel get genreModel => _genreModel;

  set genreModel(GenreModel value) {
    _genreModel = value;
    notifyListeners();
  }

  BackDropsModel _backDropsModel =
      BackDropsModel(backdrops: [], id: 0, logos: [], posters: []);

  BackDropsModel get backDropsModel => _backDropsModel;

  set backDropsModel(BackDropsModel value) {
    _backDropsModel = value;
    notifyListeners();
  }

  PopularMoviesModel _popularMoviesModel =
      PopularMoviesModel(page: 0, results: [], totalPages: 0, totalResults: 0);

  PopularMoviesModel get popularMoviesModel => _popularMoviesModel;

  set popularMoviesModel(PopularMoviesModel value) {
    _popularMoviesModel = value;
    notifyListeners();
  }

  void fetchData() async {
    popularMoviesModel =
        await APIService.getPopularMovies() ?? popularMoviesModel;
    genreModel = await APIService.getMovieGenres() ?? _genreModel;
    for (var element in genreModel.genres) {
      backDropsModel =
          await APIService.getMovieBackDrops(id: element.id) ?? _backDropsModel;
      imageURLs.add(
          "${APIConstants.imageBaseURL}${backDropsModel.backdrops.first.filePath}");
    }
  }

  void searchForData() async{
    if(searchController.text.isNotEmpty){
      searchQueryModel = await APIService.searchMovie(searchTerm: searchController.text) ?? _searchQueryModel;
    }
  }

  @override
  void callDispose() {
    // TODO: implement callDispose
  }

  @override
  void callInit() {
    fetchData();
  }
}

enum SearchBarState {
  active,
  inActive,
}
