import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailRunningPage extends StatefulWidget {
  @override
  _DetailRunningPageState createState() => _DetailRunningPageState();
}

class _DetailRunningPageState extends State<DetailRunningPage> {
  final Completer<GoogleMapController> _controller = Completer();
  bool? check = false;
  static const LatLng center = LatLng(-6.9733165, 107.6303302);
  static const LatLng sourceLocation = LatLng(-6.9709457, 107.6453798);
  static const LatLng destination = LatLng(-6.9733165, 107.6303302);
  final Set<Marker> _markers = {};
  late final BitmapDescriptor pinLocationIcon;
  LatLng _lastMapPosition = center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/1_qvmBfugDqSF1lmv5fD62aQ.png');
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polyLinePoints = PolylinePoints();

    PolylineResult result = await polyLinePoints.getRouteBetweenCoordinates(
      "AIzaSyBpxLJTQopsqBWynr1X4r7Sv0jNDnRnLeY",
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    setCustomMapPin();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Color(0xff0173C8),
        ),
        centerTitle: true,
        title: Text(
          'RUNNING',
          style: GoogleFonts.montserrat(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            decorationColor: Colors.blue,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(children: [
                  Text(
                    'RUTE',
                    style: GoogleFonts.montserrat(
                      color: Colors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: center,
                        zoom: 13.0,
                      ),
                      polylines: {
                        Polyline(
                          polylineId: const PolylineId("route"),
                          points: polylineCoordinates,
                          color: Colors.blue,
                          width: 6,
                          visible: true,
                        )
                      },
                      mapType: _currentMapType,
                      markers: {
                        const Marker(
                            markerId: MarkerId("Source"),
                            position: sourceLocation),
                        const Marker(
                          markerId: MarkerId("Destination"),
                          position: destination,
                        ),
                      },
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  check == false ? 'Mulai' : 'Selesai',
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Total Jarak\n300M',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_weather.png',
                      width: 25,
                      height: 25,
                    ),
                    Text(
                      "24'C",
                      style: GoogleFonts.montserrat(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    check == false ? '10' : '0',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 34,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  Text(
                    'M',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      check == false
                          ? setState(() {
                              check = true;
                            })
                          : Get.back();
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xff0076CB),
                          )),
                      child: Center(
                        child: Text(
                          check == false ? 'Next' : 'Finish',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Image.asset(
            'assets/icon_sport_2.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
