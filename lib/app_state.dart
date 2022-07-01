import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _localPackageString =
        prefs.getString('ff_localPackageString') ?? _localPackageString;
  }

  late SharedPreferences prefs;

  String _localPackageString = 'defaultPackageString';
  String get localPackageString => _localPackageString;
  set localPackageString(String _value) {
    _localPackageString = _value;
    prefs.setString('ff_localPackageString', _value);
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
