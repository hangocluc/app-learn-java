import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  Future<void> fetchConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 0),
    ));
    await remoteConfig.fetchAndActivate();

    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });
  }

  String getString(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString(key);
  }

  bool getBool(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getBool(key);
  }

  int getInt(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getInt(key);
  }

  double getDouble(String key) {
    final remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getDouble(key);
  }
}
