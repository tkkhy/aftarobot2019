/*
####### Generated by JavaToDart Tue Jan 01 17:12:32 SAST 2019
####### rigged up by AM Esq.
*/

import 'package:aftarobotlibrary3/beacons/google_data/advertisedid.dart';
import 'package:aftarobotlibrary3/beacons/google_data/indoorlevel.dart';
import 'package:aftarobotlibrary3/beacons/google_data/latlng.dart';
import 'package:aftarobotlibrary3/beacons/google_data/properties.dart';

class Beacon {
  String beaconName;
  AdvertisedId advertisedId;
  String status;
  String placeId;
  LatLng latLng;
  IndoorLevel indoorLevel;
  String expectedStability;
  String description;
  Properties properties;
  String path;

  Beacon({
    this.beaconName,
    this.advertisedId,
    this.status,
    this.placeId,
    this.latLng,
    this.indoorLevel,
    this.expectedStability,
    this.description,
    this.properties,
  });

  Beacon.fromJson(Map data) {
    this.beaconName = data['beaconName'];
    this.status = data['status'];
    this.placeId = data['placeId'];
    this.latLng = data['latLng'];
    this.indoorLevel = data['indoorLevel'];
    this.expectedStability = data['expectedStability'];
    this.description = data['description'];
    this.path = data['path'];
    if (data['properties'] != null) {
      properties = Properties.fromJson(data['properties']);
    }
    if (data['advertisedId'] != null) {
      advertisedId = AdvertisedId.fromJson(data['advertisedId']);
    }
  }

  Map<String, dynamic> toJson() {
    var mProp, mAd, mLat, mInd;
    if (properties != null) {
      mProp = properties.toJson();
    }
    if (advertisedId != null) {
      mAd = advertisedId.toJson();
    }
    if (indoorLevel != null) {
      mInd = indoorLevel.toJson();
    }
    if (latLng != null) {
      mLat = latLng.toJson();
    }
    Map<String, dynamic> map = {
      'beaconName': beaconName,
      'advertisedId': mAd,
      'status': status,
      'placeId': placeId,
      'latLng': mLat,
      'indoorLevel': mInd,
      'expectedStability': expectedStability,
      'description': description,
      'properties': mProp,
      'path': path,
    };
    return map;
  }
}
