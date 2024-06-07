import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/email_confirmation/domain/entities/resend_otp_entity.dart';
import 'package:http/http.dart';

abstract class ResendOtpRepository {
  FutureOr<(ResendOtpEntity?, String?)> resendOtp({required email});
}
