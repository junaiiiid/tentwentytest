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

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:tentwenty_test/constants/api_constants.dart';
import 'package:tentwenty_test/constants/app_colors.dart';
import 'package:tentwenty_test/constants/app_text_styles.dart';
import 'package:tentwenty_test/constants/my_strings.dart';
import 'package:tentwenty_test/modules/home/widgets/search_bar.dart';
import 'package:tentwenty_test/modules/watch/models/popular_movies_model.dart';
import 'package:tentwenty_test/modules/watch/view_models/watch_view_model.dart';
import 'package:tentwenty_test/services/provider_service.dart';
import 'package:tentwenty_test/services/route_service.dart';
import 'package:tentwenty_test/services/state_service.dart';

class WatchScreen extends ConsumerStatefulWidget {
  const WatchScreen({super.key});

  @override
  ConsumerState<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends ConsumerState<WatchScreen> {
  @override
  void initState() {
    context.read(ProviderService.watchProvider).callInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ProviderService.watchProvider);
    return Flex(
      direction: Axis.vertical,
      children: [
        CustomSearchBar(
          controller: state.searchController,
          onSubmitted: (value) {
            state.searchForData();
          },
        ),
        state.popularMoviesModel.results.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightWhiteSwatch,
                      border: Border(
                        top: BorderSide(
                          color: AppColors
                              .lightGreySwatch, // choose the color you want
                          width: 1.h, // choose the width you want
                        ),
                      ),
                    ),
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: getRelevantView()),
              ),
      ],
    );
  }

  Widget getRelevantView() {
    final state = ref.watch(ProviderService.watchProvider);
    if (state.searchController.text.isNotEmpty) {
      return (state.searchQueryModel.results.isEmpty)
          ? Container()
          : ListView(
              children: [
                Text(
                  MyStrings.getString.topResults,
                  style: AppTextStyles.bodyText.copyWith(fontSize: 10.sp),
                ),
                Divider(
                  color: AppColors.darkGreySwatch,
                ),
                ...state.searchQueryModel.results
                    .map<Widget>(
                      (element) => getMovieCard(result: element),
                    )
                    .toList()
              ],
            );
    } else {
      switch (state.searchBarState) {
        case SearchBarState.active:
          return GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.h,
            children: getGenreCardsList(),
          );
        case SearchBarState.inActive:
          return ListView(
            children: state.popularMoviesModel.results
                .map<Widget>(
                  (element) => getMovieCard(result: element),
                )
                .toList(),
          );
      }
    }
  }

  String getGenreById({required int id}) {
    final state = ref.watch(ProviderService.watchProvider);
    String genreName = "";
    for (var element in state.genreModel.genres) {
      if (element.id == id) {
        genreName = element.name;
      }
    }
    return genreName;
  }

  Widget getMovieSearchCards({required Result element}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListTile(
        onTap: (){
          context.goNamed(RouteNames.movie,extra:element );
        },
        leading: Container(
          height: 100,
          width: 130,
          decoration: BoxDecoration(
            color: AppColors.blackSwatch,
            borderRadius: BorderRadius.all(
              Radius.circular(5.r),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "${APIConstants.imageBaseURL}${element.backdropPath}"),
            ),
          ),
        ),
        title: Text(
          element.title,
          style: AppTextStyles.bodyText,
        ),
        subtitle: Text(
          getGenreById(
              id: (element.genreIds.isNotEmpty) ? element.genreIds.first : 28),
          style: AppTextStyles.bodyText.copyWith(fontSize: 10.sp),
        ),
        trailing: Icon(
          Icons.more_horiz,
          color: AppColors.blueSwatch,
        ),
      ),
    );
  }

  Widget getMovieCard({required Result result}) {
    return InkWell(
      onTap: (){
        context.goNamed(RouteNames.movie,extra:result);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: DecorationImage(
            image: NetworkImage(
                "${APIConstants.imageBaseURL}${result.backdropPath}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(10.h),
                child: Text(
                  result.title,
                  style: AppTextStyles.h6Text.copyWith(
                      color: AppColors.pureWhite, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGenreCard({required String imageUrl, required String title}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                title,
                style: AppTextStyles.h6Text.copyWith(
                    color: AppColors.pureWhite, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getGenreCardsList() {
    final state = ref.watch(ProviderService.watchProvider);
    List<String> imageUrls = List.from(state.imageURLs);

    if (state.genreModel.genres.length > state.imageURLs.length) {
      List<int> randomIndices = List.generate(
        state.genreModel.genres.length - state.imageURLs.length,
        (index) => Random().nextInt(state.imageURLs.length),
      );

      for (int index in randomIndices) {
        imageUrls.add(state.imageURLs[index]);
      }
    }

    List<Widget> widgetsList = [];

    for (int i = 0; i < state.genreModel.genres.length; i++) {
      widgetsList.add(getGenreCard(
          imageUrl: imageUrls[i], title: state.genreModel.genres[i].name));
    }
    return widgetsList;
  }
}
