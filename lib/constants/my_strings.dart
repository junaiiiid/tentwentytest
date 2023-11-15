// Project imports:
import 'package:tentwenty_test/generated/l10n.dart';
import 'package:tentwenty_test/services/state_service.dart';

class MyStrings {
  MyStrings._();
  static get getString => S.of(StateService.context);
}
