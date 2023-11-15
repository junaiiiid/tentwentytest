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
import 'package:tentwenty_test/generated/l10n.dart';
import 'package:tentwenty_test/services/route_service.dart';

void main() {
  runApp(const ProviderScope(child: Start()));
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (_, child) {
          return MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            routerConfig: RouteService.router,
          );
        });
  }
}
