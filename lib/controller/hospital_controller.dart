import 'package:care_giver/helper/exception_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalController extends GetxController {
  LatLng? _currentPosition;
  LatLng? get currentPosition => _currentPosition;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  MapType _mapType = MapType.normal;
  MapType get mapType => _mapType;

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw HttpException('Please enable location services');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw HttpException('Please enable location permissions');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw HttpException('Please enable location permissions');
    }
    Position currentPosition = await Geolocator.getCurrentPosition();
    _currentPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);
    _errorMessage =
        _currentPosition == null ? 'Enable to get curren position' : '';
    _isLoading = false;
  }

  getCurrentLocation() async {
    try {
      await _determinePosition();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      await Geolocator.openLocationSettings();
    }
    update();
  }

  changeMapType() {
    _mapType = _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
