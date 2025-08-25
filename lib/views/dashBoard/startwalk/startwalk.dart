import 'package:fittrack2/services_permissions.dart/activity_permissions.dart';
import 'package:fittrack2/views/dashBoard/startwalk/pause_stop.dart';
import 'package:fittrack2/views/dashBoard/startwalk/widgets/step_counter.dart';
import 'package:fittrack2/widgets/appcolors.dart';
import 'package:fittrack2/widgets/headingtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// NEW imports
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Startwalk extends StatefulWidget {
  const Startwalk({super.key});

  @override
  State<Startwalk> createState() => _StartwalkState();
}

class _StartwalkState extends State<Startwalk> {
  LatLng? _currentLocation; // user’s GPS location
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Function to get user location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if GPS is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enable location services")),
      );
      return;
    }

    // Ask permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied")),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permanently denied")),
      );
      return;
    }

    // Get position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    // Move map only if controller is ready
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 15.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Headingtext(text: "Start Walk", color: AppColors.white),
          backgroundColor: Colors.black,
        ),
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Center(
              child: Container(
                height: 550.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: AppColors.background_2,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: _currentLocation == null
                      ? const Center(child: CircularProgressIndicator())
                      : FlutterMap(
                          mapController: _mapController,
                          options: MapOptions(
                            initialCenter: _currentLocation!,
                            initialZoom: 15,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.fittrack.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: _currentLocation!,
                                  width: 60,
                                  height: 60,
                                  child: const Icon(
                                    Icons.location_pin,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.hilighter,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              ),
              onPressed: () async {
                await requestActivityPermission(); // Ask before tracking
                StepTracker().startTracking();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PauseStop()),
                );
              },
              child: Text(
                "Start Walk",
                style: TextStyle(color: AppColors.black, fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
