import 'package:hive_storage/hive_storage.dart';

class Storage {
  Storage._();

  static final Storage instance = Storage._();

  final HiveStorage _hiveInstance = HiveStorage.instance;

  Future<void> initialize() async {
    await _hiveInstance.initialize();
  }

  String? get accessToken => _hiveInstance.get('accessToken') as String?;
  Future<void> setAccessToken(final String access) async {
    await _hiveInstance.put('accessToken', access);
  }

  String? get refreshToken => _hiveInstance.get('refreshToken') as String?;
  Future<void> setRefreshToken(final String refresh) async {
    await _hiveInstance.put('refreshToken', refresh);
  }

  Future<void> logout() async {
    await _hiveInstance.delete('phoneNumber');
    await _hiveInstance.delete('userId');
    await _hiveInstance.delete('otpId');
    // await _hiveInstance.delete('deviceId');
    await _hiveInstance.delete('scooterShortKey');
    await _hiveInstance.delete('isLoggedIn');
    await _hiveInstance.delete('accessToken');
    await _hiveInstance.delete('profileName');
    await _hiveInstance.delete('profileImage');
    await _hiveInstance.delete('scooterId');
  }

  // save & fetch phoneNumber
  String? get phoneNumber => _hiveInstance.get('phoneNumber') as String?;
  Future<void> setphoneNumber(final String phoneNumber) async {
    await _hiveInstance.put('phoneNumber', phoneNumber);
  }

  // save & fetch ProfileName
  String? get profileName => _hiveInstance.get('profileName') as String?;
  Future<void> setProfileName(final String profileName) async {
    await _hiveInstance.put('profileName', profileName);
  }

  // save & fetch ProfileImage
  String? get profileImage => _hiveInstance.get('profileImage') as String?;
  Future<void> setprofileImage(final String profileImage) async {
    await _hiveInstance.put('profileImage', profileImage);
  }

  //save & fetch userId
  String? get userId => _hiveInstance.get('userId') as String?;
  Future<void> setuserId(final String userId) async {
    await _hiveInstance.put('userId', userId);
  }

  //save & fetch otpId
  String? get otpId => _hiveInstance.get('otpId') as String?;
  Future<void> setotpId(final String otpId) async {
    await _hiveInstance.put('otpId', otpId);
  }

  //save & fetch deviceId
  String? get deviceId => _hiveInstance.get('deviceId') as String?;
  Future<void> setdeviceId(final String deviceId) async {
    await _hiveInstance.put('deviceId', deviceId);
  }

  String? get scooterShortKey =>
      _hiveInstance.get('scooterShortKey') as String?;
  Future<void> setScooterShortKey(final String scooterShortKey) async {
    await _hiveInstance.put('scooterShortKey', scooterShortKey);
  }

  // scooter id
  String? get scooterId => _hiveInstance.get('scooterId') as String?;
  Future<void> setScooterId(final String scooterId) async {
    await _hiveInstance.put('scooterId', scooterId);
  }

  bool get firstTime => _hiveInstance.get('firstTime') as bool? ?? true;
  Future<void> setFirstTime(final bool firstTime) async {
    await _hiveInstance.put('firstTime', firstTime);
  }

  bool get isLoggedIn => _hiveInstance.get('isLoggedIn') as bool? ?? false;
  Future<void> setLoggedIn(final bool isLoggedIn) async {
    await _hiveInstance.put('isLoggedIn', isLoggedIn);
  }

  bool? get themeMode => _hiveInstance.get('themeMode') as bool?;
  Future<void> setThemeMode(final bool? themeMode) async {
    await _hiveInstance.put('themeMode', themeMode);
  }
}
