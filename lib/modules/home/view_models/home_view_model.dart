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

// Project imports:
import 'package:tentwenty_test/architecture/base_view_model.dart';

class HomeViewModel extends BaseViewModel{

  List<NavBarItems> listOfNavBarItems = [
    NavBarItems.dashboard,
    NavBarItems.watch,
    NavBarItems.mediaLibrary,
    NavBarItems.more
  ];

  NavBarItems _activeNavBarItem = NavBarItems.watch;

  NavBarItems get activeNavBarItem => _activeNavBarItem;

  set activeNavBarItem(NavBarItems value) {
    _activeNavBarItem = value;
    notifyListeners();
  }

  @override
  void callDispose() {
    // TODO: implement callDispose
  }

  @override
  void callInit() {
    // TODO: implement callInit
  }
}

enum NavBarItems{
  dashboard,
  watch,
  mediaLibrary,
  more
}
