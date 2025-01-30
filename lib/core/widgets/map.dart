import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewAction extends StatefulWidget {
  const MapViewAction({super.key});

  @override
  State<MapViewAction> createState() => _MapViewActionState();
}

class _MapViewActionState extends State<MapViewAction> {
  late GoogleMapController mapController;

  Set<Marker> markers = {}; // مجموعة لتخزين الماركرات

  final LatLng center = LatLng(21.42664000, 39.82563000); // San Francisco

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    
  }

  @override
  void initState() {
   
    super.initState();
     addMarker(); 
  }
   void addMarker() {
    markers.add(
      Marker(
        markerId: MarkerId('my_marker'), // معرّف الماركر
        position: center, // موقع الماركر
        infoWindow: InfoWindow(
          title: 'مكة',
          snippet: 'This is a marker example',
        ),
      ),
    );
  }
    void goToTheLake() {
      // LatLng newPosition = LatLng(45.521563, -122.677433); // إحداثيات جديدة
    mapController.animateCamera(CameraUpdate.newLatLng(center));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: goToTheLake,
        child: GoogleMap(
          markers: markers,
           onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: center, zoom: 10),
        ),
      ),
    );
  }
}
