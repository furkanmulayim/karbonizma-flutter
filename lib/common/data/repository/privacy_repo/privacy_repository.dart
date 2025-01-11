import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';

abstract class PrivacyRepository {
  Future<PrivacyModel> getPrivacy();
}
