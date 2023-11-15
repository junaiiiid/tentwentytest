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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:tentwenty_test/constants/api_constants.dart';
import 'package:tentwenty_test/constants/app_colors.dart';
import 'package:tentwenty_test/constants/app_text_styles.dart';
import 'package:tentwenty_test/modules/home/widgets/responsive_scaffold.dart';
import 'package:tentwenty_test/modules/watch/models/popular_movies_model.dart';
import 'package:tentwenty_test/services/route_service.dart';
import 'package:tentwenty_test/widgets/buttons.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Result result;
  const MovieDetailsScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: AppColors.blackSwatch,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "${APIConstants.imageBaseURL}${result.posterPath}")),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: InkWell(
                    onTap: () {
                      context.go(RouteNames.homeScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          color: AppColors.pureWhite,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Watch",
                          style: AppTextStyles.h6Text.copyWith(
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "In theaters december 22, 2021",
                          style: AppTextStyles.h6Text.copyWith(
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w300),
                        ),
                        Buttons.customFillButton(
                            text: "Get Tickets", onTap: () {}),
                        Buttons.customBorderButton(
                            text: "Watch Trailer",
                            onTap: () async{
                             await _launchUrl();
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Genres",
                    style: AppTextStyles.h6Text
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  getGenreElements(genreName: "Science"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Divider(
                      color: AppColors.darkGreySwatch,
                    ),
                  ),
                  Text(
                    "Overview",
                    style: AppTextStyles.h6Text
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    result.overview,
                    style: AppTextStyles.bodyText
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    String title = result.title.replaceAll(" ", "+");
    String url = "https://www.youtube.com/results?search_query=$title";

    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch url');
    }
  }

  Widget getGenreElements({required String genreName}) {
    List<Color> colorList = [
      AppColors.blackSwatch,
      AppColors.blueSwatch,
      AppColors.greenSwatch,
      AppColors.yellowSwatch,
      AppColors.purpleSwatch
    ];

    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: colorList[Random().nextInt(colorList.length)],
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Text(
          genreName,
          style: AppTextStyles.bodyText.copyWith(color: AppColors.pureWhite),
        ),
      ),
    );
  }
}
