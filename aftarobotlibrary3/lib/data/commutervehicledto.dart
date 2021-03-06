import 'package:aftarobotlibrary3/data/userdto.dart';
import 'package:aftarobotlibrary3/data/vehicledto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class CommuterVehicleDTO {
  String vehicleID;
  String ownerID;
  String userID;
  String commuterVehicleID;
  String stringDate;
  String beaconID;
  VehicleDTO vehicle;
  UserDTO user;
  int date;
  double latitude;
  double longitude;
  bool starting;
  bool stopping;
  String path;

  CommuterVehicleDTO({
    this.vehicleID,
    this.ownerID,
    this.userID,
    this.commuterVehicleID,
    this.stringDate,
    this.beaconID,
    this.vehicle,
    this.user,
    this.date,
    this.latitude,
    this.longitude,
    this.starting,
    this.stopping,
  });

  CommuterVehicleDTO.fromJson(Map data) {
    this.vehicleID = data['vehicleID'];
    this.ownerID = data['ownerID'];
    this.userID = data['userID'];
    this.commuterVehicleID = data['commuterVehicleID'];
    this.stringDate = data['stringDate'];
    this.beaconID = data['beaconID'];
    this.vehicle = data['vehicle'];
    this.user = data['user'];
    this.date = data['date'];
    this.latitude = data['latitude'];
    this.longitude = data['longitude'];
    this.starting = data['starting'];
    this.stopping = data['stopping'];
    this.path = data['path'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'vehicleID': vehicleID,
        'ownerID': ownerID,
        'userID': userID,
        'commuterVehicleID': commuterVehicleID,
        'stringDate': stringDate,
        'beaconID': beaconID,
        'vehicle': vehicle,
        'user': user,
        'date': date,
        'latitude': latitude,
        'longitude': longitude,
        'starting': starting,
        'stopping': stopping,
        'path': path,
      };
}
