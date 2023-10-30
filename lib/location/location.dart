import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  bool serviceEnabled = false;
  late LocationPermission permission;
  late Position? current_position;

  Function get onError => (){
  current_position = null;
  };

  Future<bool> _handleLocationPermissionSync() async {

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever){
      return false;
    }
    return serviceEnabled;

  }

  Future<Position?> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermissionSync();
    if(!hasPermission) {
      current_position = null;
      return current_position;
    }
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).then((Position position) => {
     current_position = position
    }).catchError(onError);
    return current_position;

  }
}

