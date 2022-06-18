import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  MapWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
    required this.mapType,
    required this.markers,
  }) : super(key: key);
  final double latitude;
  final double longitude;
  final MapType mapType;
  final Set<Marker> markers;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: mapType,
      markers: markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14.4746,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
