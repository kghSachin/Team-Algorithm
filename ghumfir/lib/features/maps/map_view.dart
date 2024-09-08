import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/maps/bottom_sheet_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({Key? key}) : super(key: key);

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  final locations = const [
    LatLng(26.4831, 87.28337),
    LatLng(26.4831, 87.38337),
    LatLng(26.4331, 86.29337),
    LatLng(26.4881, 87.20337),
    LatLng(26.4801, 87.28337),
    LatLng(26.4851, 87.26337),
    LatLng(26.4801, 87.29337),
    LatLng(26.4211, 87.28337),
    LatLng(26.4841, 87.24337),
    LatLng(26.4211, 87.38337),
  ];

  late List<MarkerData> _customMarkers;

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker('H', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-2'), position: locations[1]),
          child: _customMarker('C', Colors.red)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-3'), position: locations[2]),
          child: _customMarker('C', Colors.green)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker('A', Colors.blue)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGoogleMapMarkerBuilder(
        //screenshotDelay: const Duration(seconds: 4),
        customMarkers: [
          ...List.generate(20, (index) {
            return MarkerData(
                marker: Marker(
                    onTap: () => showBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (context) => MapInfoBottomSheet()),
                    markerId: MarkerId('id-$index'),
                    position: locations[index % 5]),
                child: _customMarker('${index % 2 == 0 ? "H" : "V"}',
                    index % 2 == 0 ? Colors.black : Colors.amber));
          })
        ],
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(26.4801, 87.28337),
                  zoom: 14.4746,
                ),
                markers: markers,
                onMapCreated: (GoogleMapController controller) {},
              ),
              Positioned(
                  bottom: 110,
                  right: 12,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2))
                          ]),
                      child: Center(
                        child: Icon(Icons.location_on),
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }

  _customMarker(String symbol, Color color) {
    return Stack(
      children: [
        Icon(
          Icons.add_location,
          color: color,
          size: 50,
        ),
        Positioned(
          left: 15,
          top: 8,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(symbol)),
          ),
        )
      ],
    );
  }
}
