import 'package:fittrack2/views/dashBoard/startwalk/widgets/step_counter.dart';
import 'package:fittrack2/views/dashBoard/walksummary.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class PauseStop extends StatefulWidget {
  const PauseStop({super.key});

  @override
  State<PauseStop> createState() => _PauseStopState();
}

class _PauseStopState extends State<PauseStop> {
  bool isPaused = StepTracker().isPaused;
  final MapController _mapController = MapController();

  List<LatLng> _pathPoints = [];
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    StepTracker().startTracking();
    _initLocationTracking();
  }

  Future<void> _initLocationTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 5, // update every 5 meters
      ),
    ).listen((Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _pathPoints.add(_currentPosition!);

        // Move map to current location
        _mapController.move(_currentPosition!, _mapController.camera.zoom);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            // 🔹 Map
            Expanded(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(20.5937, 78.9629), // fallback India
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  // 🔹 Polyline showing path
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _pathPoints,
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  // 🔹 Marker for current location
                  if (_currentPosition != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _currentPosition!,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.my_location,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            // 🔹 Bottom controls
            Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              color: AppColors.background_2,
              child: Column(
                children: [
                  StreamBuilder<int>(
                    stream: StepTracker().stepCountStream,
                    builder: (context, snapshot) {
                      final steps = snapshot.data ?? 0;
                      return Text(
                        "$steps steps",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (isPaused) {
                              StepTracker().resumeTracking();
                            } else {
                              StepTracker().pauseTracking();
                            }
                            isPaused = !isPaused;
                          });
                        },
                        icon: Icon(
                          isPaused
                              ? Icons.play_circle_fill_outlined
                              : Icons.pause_circle_filled_outlined,
                          size: 60.sp,
                          color: AppColors.background_1,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200.w, 50.h),
                          backgroundColor: AppColors.background_1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () {
                          StepTracker().stopTracking();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Walksummary(),
                            ),
                          );
                        },
                        child: Text(
                          "End Walk",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
