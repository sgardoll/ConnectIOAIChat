import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _systemMessage =
          await secureStorage.getString('ff_systemMessage') ?? _systemMessage;
    });
    await _safeInitAsync(() async {
      _userReinforcement =
          await secureStorage.getString('ff_userReinforcement') ??
              _userReinforcement;
    });
    await _safeInitAsync(() async {
      _gptOpener = await secureStorage.getString('ff_gptOpener') ?? _gptOpener;
    });
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _systemMessage =
      'You are a helpful AI assistant that helps answer any questions people may have!';
  String get systemMessage => _systemMessage;
  set systemMessage(String _value) {
    _systemMessage = _value;
    secureStorage.setString('ff_systemMessage', _value);
  }

  void deleteSystemMessage() {
    secureStorage.delete(key: 'ff_systemMessage');
  }

  String _userReinforcement =
      'Hello! Just to reiterate, you are a helpful AI assistant that helps answer any questions people may have!';
  String get userReinforcement => _userReinforcement;
  set userReinforcement(String _value) {
    _userReinforcement = _value;
    secureStorage.setString('ff_userReinforcement', _value);
  }

  void deleteUserReinforcement() {
    secureStorage.delete(key: 'ff_userReinforcement');
  }

  String _gptOpener = 'How can I help you today?';
  String get gptOpener => _gptOpener;
  set gptOpener(String _value) {
    _gptOpener = _value;
    secureStorage.setString('ff_gptOpener', _value);
  }

  void deleteGptOpener() {
    secureStorage.delete(key: 'ff_gptOpener');
  }

  bool _awaitingReply = false;
  bool get awaitingReply => _awaitingReply;
  set awaitingReply(bool _value) {
    _awaitingReply = _value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String _value) {
    _prompt = _value;
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    secureStorage.setString('ff_apiKey', _value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
