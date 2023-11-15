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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:tentwenty_test/constants/app_colors.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  const ResponsiveScaffold(
      {super.key, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {

    bool useFixedWidth = false;

    if(kIsWeb){
      useFixedWidth = true;
    }
    else{
      useFixedWidth = false;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackSwatch,
        body: Center(
          child: SizedBox(
              width: useFixedWidth?500:double.infinity,
              child: Scaffold(
                bottomNavigationBar: bottomNavigationBar,
                body: Padding(
                  padding: EdgeInsets.zero,
                  child: body,
                ),
              )),
        ),
      ),
    );
  }
}
