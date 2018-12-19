import 'package:aftarobotlibrary/data/vehicletypedto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class VehicleFinishedDrivingDTO {
  String vehicleFinishedDrivingID;
  String vehicleID;
  String userID;
  String userName;
  String stringDate;
  String vehicleReg;
  String ownerID;
  String associationID;
  String nearestAddress;
  String beaconName;
  double latitude;
  double longitude;
  VehicleTypeDTO vehicleType;
  int date;
  bool viaAwarenessAPI;
  bool viaNeura;
  bool viaHypertrack;
  bool beaconFound;
  double bearing;
  double speed;
  String path;

  VehicleFinishedDrivingDTO({
    this.vehicleFinishedDrivingID,
    this.vehicleID,
    this.userID,
    this.userName,
    this.stringDate,
    this.vehicleReg,
    this.ownerID,
    this.associationID,
    this.nearestAddress,
    this.beaconName,
    this.latitude,
    this.longitude,
    this.vehicleType,
    this.date,
    this.viaAwarenessAPI,
    this.viaNeura,
    this.viaHypertrack,
    this.beaconFound,
    this.bearing,
    this.speed,
  });

  VehicleFinishedDrivingDTO.fromJson(Map data) {
    this.vehicleFinishedDrivingID = data['vehicleFinishedDrivingID'];
    this.vehicleID = data['vehicleID'];
    this.userID = data['userID'];
    this.userName = data['userName'];
    this.stringDate = data['stringDate'];
    this.vehicleReg = data['vehicleReg'];
    this.ownerID = data['ownerID'];
    this.associationID = data['associationID'];
    this.nearestAddress = data['nearestAddress'];
    this.beaconName = data['beaconName'];
    this.latitude = data['latitude'];
    this.longitude = data['longitude'];
    this.vehicleType = data['vehicleType'];
    this.date = data['date'];
    this.viaAwarenessAPI = data['viaAwarenessAPI'];
    this.viaNeura = data['viaNeura'];
    this.viaHypertrack = data['viaHypertrack'];
    this.beaconFound = data['beaconFound'];
    this.bearing = data['bearing'];
    this.speed = data['speed'];
    this.path = data['path'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'vehicleFinishedDrivingID': vehicleFinishedDrivingID,
        'vehicleID': vehicleID,
        'userID': userID,
        'userName': userName,
        'stringDate': stringDate,
        'vehicleReg': vehicleReg,
        'ownerID': ownerID,
        'associationID': associationID,
        'nearestAddress': nearestAddress,
        'beaconName': beaconName,
        'latitude': latitude,
        'longitude': longitude,
        'vehicleType': vehicleType,
        'date': date,
        'viaAwarenessAPI': viaAwarenessAPI,
        'viaNeura': viaNeura,
        'viaHypertrack': viaHypertrack,
        'beaconFound': beaconFound,
        'bearing': bearing,
        'speed': speed,
        'path': path,
      };
}
