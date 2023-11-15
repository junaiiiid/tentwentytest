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

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:tentwenty_test/modules/home/view_models/home_view_model.dart';
import 'package:tentwenty_test/modules/watch/view_models/watch_view_model.dart';
import 'package:tentwenty_test/services/state_service.dart';

class ProviderService {
  ProviderService._();

  static ChangeNotifierProvider<HomeViewModel> homeProvider =
  StateService.createProvider(() => HomeViewModel());

  static ChangeNotifierProvider<WatchViewModel> watchProvider =
  StateService.createProvider(() => WatchViewModel());
}
