import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedConfig {
  static SharedPreferences pref;
}


final boxStorage=GetStorage();

const String KEY_TOKEN="TOKEN";
const String KEY_USER_ID="USER_ID";
const String KEY_USER_NAME="USER_NAME";
const String KEY_USER_PHONE = "USER_PHONE";
const String KEY_USER_EMAIL = "USER_EMAIL";
const String KEY_USER_ADDRESS = "USER_ADDRESS";
const String KEY_USER_AREA = "USER_AREA";
const String KEY_USER_CITY = "USER_CITY";
const String KEY_USER_COUNTRY = "USER_COUNTRY";
const String KEY_USER_GENDER = "USER_GENDER";
const String KEY_USER_BIRTHDAY = "USER_BIRTHDAY";
const String KEY_USER_STATUS = "USER_STATUS";
const String KEY_USER_AVATAR = "USER_AVATAR";
const String KEY_USER_CREATED_AT = "USER_CREATED_AT";
const String KEY_USER_UPDATED_AT = "USER_UPDATED_AT";