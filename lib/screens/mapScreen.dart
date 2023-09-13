import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _mapPageState();
}

class _mapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  Location _location = Location(); // Declare _location here
  // Multiple hardcoded destinations
  final List<LatLng> stops = [
    LatLng(8.3269, 80.4054), // Keells
    LatLng(8.3316, 80.4091), // Cargills
    LatLng(8.3371, 80.4112), // Arpico
    // Add more stops if desired
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate with Multiple Stops'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: stops.first,
          zoom: 10.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigate,
        label: Text('Start Navigation'),
        icon: Icon(Icons.navigation),
      ),
    );
  }

  void _navigate() async {
    var currentLocation = await _location.getLocation();
    String waypoints = stops
        .skip(1)
        .map((stop) => "${stop.latitude},${stop.longitude}")
        .join('|'); // skip the first as it's the final destination in this case
    final String googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${stops.first.latitude},${stops.first.longitude}&waypoints=$waypoints&travelmode=driving";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      print('Could not launch $googleMapsUrl');
    }
  }
}
