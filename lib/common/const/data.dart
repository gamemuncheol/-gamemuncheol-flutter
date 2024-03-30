// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Data {
  static final String ACCESS_TOKEN_KEY = dotenv.env["ACCESS_TOKEN_KEY"]!;
  static final String REFRESH_TOKEN_KEY = dotenv.env["REFRESH_TOKEN_KEY"]!;

  static final String BASE_URL = dotenv.env["BASE_URL"]!;

  static final String OAUTH_WAS_URL = dotenv.env["OAUTH_WAS_URL"]!;
  static final String OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY =
      dotenv.env["OAUTH_REDIRECT_QUERY_PARAM_ACCESSTOKEN_KEY"]!;
  static final String OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY =
      dotenv.env["OAUTH_REDIRECT_QUERY_PARAM_REFRESHTOKEN_KEY"]!;

  static final String NOUNCE = "${dotenv.env["NOUNCE"]!}#";
}
