import 'package:basic_utils/basic_utils.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';

class CommonUtils {
  const CommonUtils._();

  static String? mobileNumberValidator(
    String? value, {
    bool isRequired = false,
  }) {
    if (StringUtils.isNullOrEmpty(value) && isRequired) {
      return AppConstants.mobileNumberRequired;
    } else if (value!.length > 10) {
      return AppConstants.mobileNumberMaxLength;
    }
    return null;
  }
}
