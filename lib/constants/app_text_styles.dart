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
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:tentwenty_test/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle smallBodyText = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyText = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle h1Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h3Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h4Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h5Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h6Text = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.fontSwatch,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );
}
