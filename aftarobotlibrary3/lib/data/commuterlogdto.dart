import 'package:aftarobotlibrary3/data/devicedto.dart';
import 'package:aftarobotlibrary3/data/userdto.dart';
import 'package:aftarobotlibrary3/data/vehicledto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class CommuterLogDTO {
  String commuterLogID;
  String panicID;
  String userID;
  String vehicleID;
  String stringDate;
  VehicleDTO vehicle;
  UserDTO user;
  double latitude;
  double longitude;
  int date;
  double accuracy;
  double bearing;
  DeviceDTO device;
  String path;

  CommuterLogDTO({
    this.commuterLogID,
    this.panicID,
    this.userID,
    this.vehicleID,
    this.stringDate,
    this.vehicle,
    this.user,
    this.latitude,
    this.longitude,
    this.date,
    this.accuracy,
    this.bearing,
    this.device,
  });

  CommuterLogDTO.fromJson(Map data) {
    this.commuterLogID = data['commuterLogID'];
    this.panicID = data['panicID'];
    this.userID = data['userID'];
    this.vehicleID = data['vehicleID'];
    this.stringDate = data['stringDate'];
    this.vehicle = data['vehicle'];
    this.user = data['user'];
    this.latitude = data['latitude'];
    this.longitude = data['longitude'];
    this.date = data['date'];
    this.accuracy = data['accuracy'];
    this.bearing = data['bearing'];
    this.device = data['device'];
    this.path = data['path'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'commuterLogID': commuterLogID,
        'panicID': panicID,
        'userID': userID,
        'vehicleID': vehicleID,
        'stringDate': stringDate,
        'vehicle': vehicle,
        'user': user,
        'latitude': latitude,
        'longitude': longitude,
        'date': date,
        'accuracy': accuracy,
        'bearing': bearing,
        'device': device,
        'path': path,
      };
}
