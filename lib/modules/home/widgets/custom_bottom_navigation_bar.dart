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
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:tentwenty_test/constants/app_colors.dart';
import 'package:tentwenty_test/constants/app_text_styles.dart';
import 'package:tentwenty_test/modules/home/view_models/home_view_model.dart';
import 'package:tentwenty_test/services/provider_service.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ProviderService.homeProvider);
    return NavigationBar(
        backgroundColor: AppColors.blackSwatch,
        destinations: state.listOfNavBarItems
            .map((elements) => navBarIcon(
                item: elements,
                activeItem: state.activeNavBarItem,
                onTap: () {
                  state.activeNavBarItem = elements;
                }))
            .toList());
  }

  Widget navBarIcon(
      {required NavBarItems item,
      required NavBarItems activeItem,
      required Function() onTap}) {
    IconData? iconData;
    String itemName;
    Color activeColor =
        (activeItem == item) ? AppColors.pureWhite : AppColors.darkGreySwatch;
    switch (item) {
      case NavBarItems.dashboard:
        iconData = Icons.menu;
        itemName = "Dashboard";
      case NavBarItems.watch:
        iconData = Icons.play_circle_rounded;
        itemName = "Watch";
      case NavBarItems.mediaLibrary:
        iconData = Icons.library_books_rounded;
        itemName = "Media Library";
      case NavBarItems.more:
        iconData = Icons.menu;
        itemName = "More";
    }
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: activeColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            itemName,
            style: AppTextStyles.bodyText.copyWith(color: activeColor),
          ),
        ],
      ),
    );
  }
}
