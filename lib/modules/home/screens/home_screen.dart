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

// Project imports:
import 'package:tentwenty_test/modules/dashboard/screens/dashboard_screen.dart';
import 'package:tentwenty_test/modules/home/view_models/home_view_model.dart';
import 'package:tentwenty_test/modules/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:tentwenty_test/modules/home/widgets/responsive_scaffold.dart';
import 'package:tentwenty_test/modules/home/widgets/search_bar.dart';
import 'package:tentwenty_test/modules/media_library/screens/media_library_screen.dart';
import 'package:tentwenty_test/modules/more/screens/more_screen.dart';
import 'package:tentwenty_test/modules/watch/screens/watch_screen.dart';
import 'package:tentwenty_test/services/provider_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(ProviderService.homeProvider);
    return  ResponsiveScaffold(
      body: getBody(items: state.activeNavBarItem),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget getBody({required NavBarItems items}){
    switch(items){

      case NavBarItems.dashboard:
        return const DashboardScreen();
      case NavBarItems.watch:
        return const WatchScreen();
      case NavBarItems.mediaLibrary:
        return const MediaLibraryScreen();
      case NavBarItems.more:
        return const MoreScreen();
    }
  }
}
