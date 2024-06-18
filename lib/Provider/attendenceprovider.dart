import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shop/Api/api2.dart';

class AttendanceProvider with ChangeNotifier {
  String? longitude;
  String? latitude;
  String? street;
  String? postalCode;
  String? district;
  String? errorMessage;
  bool isLoading = false;
  Map<String, dynamic>? response;

  Future<void> markAttendance() async {
    isLoading = true;
    notifyListeners();

    try {
      Position position = await _determinePosition();

      longitude = position.longitude.toString();
      latitude = position.latitude.toString();

      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        street = place.street ?? "";
        postalCode = place.postalCode ?? "";
        district = place.locality ?? "";
      } else {
        street = "";
        postalCode = "";
        district = "";
      }

      response = await Api2.attendance(
        longitude!, 
        latitude!, 
        street!, 
        postalCode!, 
        district!
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    } 

    return await Geolocator.getCurrentPosition();
  }
}