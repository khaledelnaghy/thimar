import 'dart:developer';

import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewAction extends StatefulWidget {
  final Function(LatLng, String) onLocationSelected;
  const MapViewAction({super.key, required this.onLocationSelected});

  @override
  State<MapViewAction> createState() => _MapViewActionState();
}

class _MapViewActionState extends State<MapViewAction> {
  LatLng? currentPosition;
  late GoogleMapController mapController;
  LatLng center = const LatLng(21.4225, 39.8262);
  Set<Marker> markers = {};
  Future<String> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        return "${placemark.street}, ${placemark.locality}, ${placemark.country}";
      } else {
        return "Address not found";
      }
    } catch (e) {
      log("$e");
      return "Error fetching address";
    }
  }

  // LatLng? currentPosition;
  // late Position position;
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    // addMarker();
    updatedMarker(
      center,
    );
    getCurrentLocationn();
  }

  Future<void> getCurrentLocationn() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: currentPosition!,
            infoWindow: InfoWindow(title: 'You are here'),
          ),
        );
      });
    } on Exception catch (e) {
      log("Error: $e");
      // ignore: use_build_context_synchronously
      scaffoldMessenger(context, "Error : $e");
    }
  }

  void updatedMarker(LatLng newPosition) {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          markerId: MarkerId("selectedLocation "),
          position: newPosition,
          infoWindow: InfoWindow(title: "Selected Location"),
        ),
      );
    });
  }

  void onMapTapped(LatLng newPosition) {
    setState(() {
      currentPosition = newPosition;
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId('selectedLocation'),
          position: newPosition,
          infoWindow: InfoWindow(title: 'Selected Location'),
        ),
      );
    });
    mapController.animateCamera(CameraUpdate.newLatLng(newPosition));
    updatedMarker(newPosition); // تحديث الماركر
  }

  // void addMarker() {
  //   markers.add(
  //     Marker(
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //       markerId: MarkerId('my_marker'), // معرّف الماركر
  //       position: center, // موقع الماركر
  //       infoWindow: InfoWindow(
  //         title: 'الموقع الحالي ',
  //         snippet: 'This is a marker example',
  //       ),
  //     ),
  //   );
  // }

  // LatLng? selectedLatLong;

  void handleLocationSelection(LatLng location) {
    updatedMarker(location);
    mapController.animateCamera(CameraUpdate.newLatLng(location));
    widget.onLocationSelected(location, 'static'); // Call the callback
  }

  void goToTheLake() {
    // LatLng newPosition = LatLng(45.521563, -122.677433); // إحداثيات جديدة

    mapController.animateCamera(CameraUpdate.newLatLng(center));
  }

  void onLocationSelected(LatLng location) {
    updatedMarker(location);
    mapController.animateCamera(CameraUpdate.newLatLng(location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : InkWell(
                    onTap: goToTheLake,
                    child: GoogleMap(
                      // mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,

                      // compassEnabled: true,
                      markers: markers,
                      onTap: onMapTapped,
                      onMapCreated: onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: currentPosition ?? center,
                        zoom: 15.0,
                      ),
                    ),
                  ),
          ),
          CustomButton(
              text: 'confirm',
              onPressed: () async {
                if (currentPosition != null) {
                  String address = await getAddressFromLatLng(currentPosition!);
                  widget.onLocationSelected(
                    currentPosition!,
                    address,
                  );
                  Navigator.pop(context);
                } else {
                  scaffoldMessenger(context, "Location not available");
                }
              })
        ],
      ),
    );
  }
}
