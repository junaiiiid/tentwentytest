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

class BackDropsModel {
  List<Backdrop> backdrops;
  int id;
  List<Backdrop> logos;
  List<Backdrop> posters;

  BackDropsModel({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  factory BackDropsModel.fromJson(Map<String, dynamic> json) {
    return BackDropsModel(
      backdrops: (json['backdrops'] as List)
          .map((item) => Backdrop.fromJson(item))
          .toList(),
      id: json['id'],
      logos: (json['logos'] as List)
          .map((item) => Backdrop.fromJson(item))
          .toList(),
      posters: (json['posters'] as List)
          .map((item) => Backdrop.fromJson(item))
          .toList(),
    );
  }
}

class Backdrop {
  double aspectRatio;
  int height;
  String? iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  Backdrop({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Backdrop.fromJson(Map<String, dynamic> json) {
    return Backdrop(
      aspectRatio: json['aspect_ratio'],
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }
}
