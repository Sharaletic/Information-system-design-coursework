import 'package:coursework_pis/core/utils/app_strings.dart';

class ServerException {
  ServerException([this.message = AppStrings.serverExceptionMessage]);
  final String message;
}
