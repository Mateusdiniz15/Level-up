import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_tipoUsuarioJson') != null) {
        try {
          _tipoUsuarioJson = jsonDecode(
              await secureStorage.getString('ff_tipoUsuarioJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _extensoesAppState =
          await secureStorage.getStringList('ff_extensoesAppState') ??
              _extensoesAppState;
    });
    await _safeInitAsync(() async {
      _extensoesAudioAppState =
          await secureStorage.getStringList('ff_extensoesAudioAppState') ??
              _extensoesAudioAppState;
    });
    await _safeInitAsync(() async {
      _extensoesWord = await secureStorage.getStringList('ff_extensoesWord') ??
          _extensoesWord;
    });
    await _safeInitAsync(() async {
      _extensoesExcel =
          await secureStorage.getStringList('ff_extensoesExcel') ??
              _extensoesExcel;
    });
    await _safeInitAsync(() async {
      _extensoesPPT =
          await secureStorage.getStringList('ff_extensoesPPT') ?? _extensoesPPT;
    });
    await _safeInitAsync(() async {
      _extensoesImg =
          await secureStorage.getStringList('ff_extensoesImg') ?? _extensoesImg;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _tipoUsuario = '';
  String get tipoUsuario => _tipoUsuario;
  set tipoUsuario(String value) {
    _tipoUsuario = value;
  }

  dynamic _tipoUsuarioJson =
      jsonDecode('{\"aluno\":\"Aluno\",\"mentor\":\"Mentor\"}');
  dynamic get tipoUsuarioJson => _tipoUsuarioJson;
  set tipoUsuarioJson(dynamic value) {
    _tipoUsuarioJson = value;
    secureStorage.setString('ff_tipoUsuarioJson', jsonEncode(value));
  }

  void deleteTipoUsuarioJson() {
    secureStorage.delete(key: 'ff_tipoUsuarioJson');
  }

  List<String> _extensoesAppState = [
    'mp4',
    'wmv',
    'avi',
    'mov',
    'qt',
    'mkv',
    'avchd',
    'flv',
    'swf'
  ];
  List<String> get extensoesAppState => _extensoesAppState;
  set extensoesAppState(List<String> value) {
    _extensoesAppState = value;
    secureStorage.setStringList('ff_extensoesAppState', value);
  }

  void deleteExtensoesAppState() {
    secureStorage.delete(key: 'ff_extensoesAppState');
  }

  void addToExtensoesAppState(String value) {
    _extensoesAppState.add(value);
    secureStorage.setStringList('ff_extensoesAppState', _extensoesAppState);
  }

  void removeFromExtensoesAppState(String value) {
    _extensoesAppState.remove(value);
    secureStorage.setStringList('ff_extensoesAppState', _extensoesAppState);
  }

  void removeAtIndexFromExtensoesAppState(int index) {
    _extensoesAppState.removeAt(index);
    secureStorage.setStringList('ff_extensoesAppState', _extensoesAppState);
  }

  void updateExtensoesAppStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesAppState[index] = updateFn(_extensoesAppState[index]);
    secureStorage.setStringList('ff_extensoesAppState', _extensoesAppState);
  }

  void insertAtIndexInExtensoesAppState(int index, String value) {
    _extensoesAppState.insert(index, value);
    secureStorage.setStringList('ff_extensoesAppState', _extensoesAppState);
  }

  List<String> _extensoesAudioAppState = ['mp3', 'wav', 'pcm', 'flac', 'wma'];
  List<String> get extensoesAudioAppState => _extensoesAudioAppState;
  set extensoesAudioAppState(List<String> value) {
    _extensoesAudioAppState = value;
    secureStorage.setStringList('ff_extensoesAudioAppState', value);
  }

  void deleteExtensoesAudioAppState() {
    secureStorage.delete(key: 'ff_extensoesAudioAppState');
  }

  void addToExtensoesAudioAppState(String value) {
    _extensoesAudioAppState.add(value);
    secureStorage.setStringList(
        'ff_extensoesAudioAppState', _extensoesAudioAppState);
  }

  void removeFromExtensoesAudioAppState(String value) {
    _extensoesAudioAppState.remove(value);
    secureStorage.setStringList(
        'ff_extensoesAudioAppState', _extensoesAudioAppState);
  }

  void removeAtIndexFromExtensoesAudioAppState(int index) {
    _extensoesAudioAppState.removeAt(index);
    secureStorage.setStringList(
        'ff_extensoesAudioAppState', _extensoesAudioAppState);
  }

  void updateExtensoesAudioAppStateAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesAudioAppState[index] = updateFn(_extensoesAudioAppState[index]);
    secureStorage.setStringList(
        'ff_extensoesAudioAppState', _extensoesAudioAppState);
  }

  void insertAtIndexInExtensoesAudioAppState(int index, String value) {
    _extensoesAudioAppState.insert(index, value);
    secureStorage.setStringList(
        'ff_extensoesAudioAppState', _extensoesAudioAppState);
  }

  List<String> _extensoesWord = ['doc', 'docx'];
  List<String> get extensoesWord => _extensoesWord;
  set extensoesWord(List<String> value) {
    _extensoesWord = value;
    secureStorage.setStringList('ff_extensoesWord', value);
  }

  void deleteExtensoesWord() {
    secureStorage.delete(key: 'ff_extensoesWord');
  }

  void addToExtensoesWord(String value) {
    _extensoesWord.add(value);
    secureStorage.setStringList('ff_extensoesWord', _extensoesWord);
  }

  void removeFromExtensoesWord(String value) {
    _extensoesWord.remove(value);
    secureStorage.setStringList('ff_extensoesWord', _extensoesWord);
  }

  void removeAtIndexFromExtensoesWord(int index) {
    _extensoesWord.removeAt(index);
    secureStorage.setStringList('ff_extensoesWord', _extensoesWord);
  }

  void updateExtensoesWordAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesWord[index] = updateFn(_extensoesWord[index]);
    secureStorage.setStringList('ff_extensoesWord', _extensoesWord);
  }

  void insertAtIndexInExtensoesWord(int index, String value) {
    _extensoesWord.insert(index, value);
    secureStorage.setStringList('ff_extensoesWord', _extensoesWord);
  }

  List<String> _extensoesExcel = ['xlsx', 'xls', 'csv'];
  List<String> get extensoesExcel => _extensoesExcel;
  set extensoesExcel(List<String> value) {
    _extensoesExcel = value;
    secureStorage.setStringList('ff_extensoesExcel', value);
  }

  void deleteExtensoesExcel() {
    secureStorage.delete(key: 'ff_extensoesExcel');
  }

  void addToExtensoesExcel(String value) {
    _extensoesExcel.add(value);
    secureStorage.setStringList('ff_extensoesExcel', _extensoesExcel);
  }

  void removeFromExtensoesExcel(String value) {
    _extensoesExcel.remove(value);
    secureStorage.setStringList('ff_extensoesExcel', _extensoesExcel);
  }

  void removeAtIndexFromExtensoesExcel(int index) {
    _extensoesExcel.removeAt(index);
    secureStorage.setStringList('ff_extensoesExcel', _extensoesExcel);
  }

  void updateExtensoesExcelAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesExcel[index] = updateFn(_extensoesExcel[index]);
    secureStorage.setStringList('ff_extensoesExcel', _extensoesExcel);
  }

  void insertAtIndexInExtensoesExcel(int index, String value) {
    _extensoesExcel.insert(index, value);
    secureStorage.setStringList('ff_extensoesExcel', _extensoesExcel);
  }

  List<String> _extensoesPPT = ['ppt', 'pptx'];
  List<String> get extensoesPPT => _extensoesPPT;
  set extensoesPPT(List<String> value) {
    _extensoesPPT = value;
    secureStorage.setStringList('ff_extensoesPPT', value);
  }

  void deleteExtensoesPPT() {
    secureStorage.delete(key: 'ff_extensoesPPT');
  }

  void addToExtensoesPPT(String value) {
    _extensoesPPT.add(value);
    secureStorage.setStringList('ff_extensoesPPT', _extensoesPPT);
  }

  void removeFromExtensoesPPT(String value) {
    _extensoesPPT.remove(value);
    secureStorage.setStringList('ff_extensoesPPT', _extensoesPPT);
  }

  void removeAtIndexFromExtensoesPPT(int index) {
    _extensoesPPT.removeAt(index);
    secureStorage.setStringList('ff_extensoesPPT', _extensoesPPT);
  }

  void updateExtensoesPPTAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesPPT[index] = updateFn(_extensoesPPT[index]);
    secureStorage.setStringList('ff_extensoesPPT', _extensoesPPT);
  }

  void insertAtIndexInExtensoesPPT(int index, String value) {
    _extensoesPPT.insert(index, value);
    secureStorage.setStringList('ff_extensoesPPT', _extensoesPPT);
  }

  String _fileNameAppState = '';
  String get fileNameAppState => _fileNameAppState;
  set fileNameAppState(String value) {
    _fileNameAppState = value;
  }

  List<String> _extensoesImg = [
    'jpeg',
    'jpg',
    'gif',
    'png',
    'bmp',
    'psd',
    'tiff',
    'svg',
    'raw',
    'webp'
  ];
  List<String> get extensoesImg => _extensoesImg;
  set extensoesImg(List<String> value) {
    _extensoesImg = value;
    secureStorage.setStringList('ff_extensoesImg', value);
  }

  void deleteExtensoesImg() {
    secureStorage.delete(key: 'ff_extensoesImg');
  }

  void addToExtensoesImg(String value) {
    _extensoesImg.add(value);
    secureStorage.setStringList('ff_extensoesImg', _extensoesImg);
  }

  void removeFromExtensoesImg(String value) {
    _extensoesImg.remove(value);
    secureStorage.setStringList('ff_extensoesImg', _extensoesImg);
  }

  void removeAtIndexFromExtensoesImg(int index) {
    _extensoesImg.removeAt(index);
    secureStorage.setStringList('ff_extensoesImg', _extensoesImg);
  }

  void updateExtensoesImgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _extensoesImg[index] = updateFn(_extensoesImg[index]);
    secureStorage.setStringList('ff_extensoesImg', _extensoesImg);
  }

  void insertAtIndexInExtensoesImg(int index, String value) {
    _extensoesImg.insert(index, value);
    secureStorage.setStringList('ff_extensoesImg', _extensoesImg);
  }
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
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
