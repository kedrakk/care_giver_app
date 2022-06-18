import 'package:care_giver/data/hospital.dart';
import 'package:care_giver/helper/exception_helper.dart';
import 'package:care_giver/repo/hospital_repo.dart';
import 'package:flutter/cupertino.dart';
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

  List<Hospital> _hospitallist = [];
  List<Hospital> get hospitalList => _hospitallist;

  final IHospitalRepo _repo;
  HospitalController(this._repo);

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

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
    if (_currentPosition != null) {
      getNearestHospitals();
    } else {
      _isLoading = false;
    }
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

  getNearestHospitals() async {
    try {
      _hospitallist = await _repo.getHospitals(
        currentPosition!.latitude,
        currentPosition!.longitude,
      );
      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: _currentPosition!,
          infoWindow: const InfoWindow(
            title: "Curret Location",
          ),
        ),
      );
      if (_hospitallist.isNotEmpty) {
        for (var element in _hospitallist) {
          _markers.add(
            Marker(
              markerId: MarkerId(element.id.toString()),
              position: LatLng(element.latitude, element.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
              infoWindow: InfoWindow(
                title: element.hospitalName,
                snippet: element.address,
              ),
            ),
          );
        }
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      update();
    }
  }
}
