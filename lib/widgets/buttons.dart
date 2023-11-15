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
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:tentwenty_test/constants/app_colors.dart';
import 'package:tentwenty_test/constants/app_text_styles.dart';

class Buttons {
  Buttons._();

  static Widget customIconButton(
          {required IconData iconData, required Function() onTap}) =>
      InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          color: AppColors.darkGreySwatch,
        ),
      );

  static Widget customFillButton(
          {required String text, required Function() onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.blueSwatch,
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.h6Text.copyWith(
                color: AppColors.pureWhite, fontWeight: FontWeight.w500),
          ),
        ),
      );

  static Widget customBorderButton(
      {required String text, required Function() onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 70.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.blueSwatch),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.h6Text.copyWith(
                color: AppColors.pureWhite, fontWeight: FontWeight.w500),
          ),
        ),
      );
}
