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

class APIConstants{
  APIConstants._();

  static const String getMovieGenre = "https://api.themoviedb.org/3/genre/movie/list";

  static const String getMovieBackdrop = "https://api.themoviedb.org/3/movie/ID/images";

  static const String getPopularMovies = "https://api.themoviedb.org/3/movie/popular";

  static const String searchMovies = "https://api.themoviedb.org/3/search/movie?&query=";

  static const String imageBaseURL = "https://image.tmdb.org/t/p/w500";

  static const Map<String,dynamic> headers = {
    "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTBmODg0NGRjNDQyODUwMjA2YThjZjVlMmRhODNhYSIsInN1YiI6IjY1NTNhNzQzMDgxNmM3MDBmZDJmM2Q0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5-e91ZcoXE7oJKZ9klK7AFXhrIBxNWyNUhKqfAighHc",
    "Accept":"application/json"
  };
}