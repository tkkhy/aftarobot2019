import 'package:aftarobotlibrary3/data/userdto.dart';
import 'package:aftarobotlibrary3/data/vehicletypedto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class VehicleDTO {
  String vehicleID;
  String ownerID;
  String associationID;
  String countryID, ownerPath, assocPath;
  String ownerName;
  String associationName;
  int date;
  int licenceExpiryDate;
  int policyIssueDate;
  int policyExpiryDate;
  int cacheDate;
  VehicleTypeDTO vehicleType;
  List photoList;
  String year;
  String operatingLicence;
  String stringDate;
  String vehicleReg;
  String status;
  String policyNumber;
  bool selected;
  UserDTO user;
  String ACTIVE;
  String IN_ACTIVE;
  String SUSPENDED;
  String path;

  VehicleDTO({
    this.vehicleID,
    this.ownerID,
    this.associationID,
    this.countryID,
    this.ownerName,
    this.associationName,
    this.date,
    this.ownerPath,
    this.assocPath,
    this.licenceExpiryDate,
    this.policyIssueDate,
    this.policyExpiryDate,
    this.cacheDate,
    this.vehicleType,
    this.photoList,
    this.year,
    this.operatingLicence,
    this.stringDate,
    this.vehicleReg,
    this.status,
    this.policyNumber,
    this.selected,
  });

  VehicleDTO.fromJson(Map data) {
    this.vehicleID = data['vehicleID'];
    this.ownerID = data['ownerID'];
    this.associationID = data['associationID'];
    this.countryID = data['countryID'];
    this.ownerName = data['ownerName'];
    this.associationName = data['associationName'];
    this.date = data['date'];
    this.ownerPath = data['ownerPath'];
    this.assocPath = data['assocPath'];
    this.licenceExpiryDate = data['licenceExpiryDate'];
    this.policyIssueDate = data['policyIssueDate'];
    this.policyExpiryDate = data['policyExpiryDate'];
    this.cacheDate = data['cacheDate'];
    if (data['vehicleType'] != null) {
      this.vehicleType = VehicleTypeDTO.fromJson(data['vehicleType']);
    }
    this.photoList = data['photoList'];
    this.year = data['year'];
    this.operatingLicence = data['operatingLicence'];
    this.stringDate = data['stringDate'];
    this.vehicleReg = data['vehicleReg'];
    this.status = data['status'];
    this.policyNumber = data['policyNumber'];
    this.selected = data['selected'];
    this.path = data['path'];
  }

  Map<String, dynamic> toJson() {
    Map m;
    if (vehicleType != null) {
      m = vehicleType.toJson();
    } else {
      print('VehicleDTO.toJson ERROR ERROR vehicle has no type!!!!!!!!!');
    }
    Map<String, dynamic> map = {
      'vehicleID': vehicleID,
      'ownerID': ownerID,
      'associationID': associationID,
      'countryID': countryID,
      'ownerName': ownerName,
      'associationName': associationName,
      'date': date,
      'ownerPath': ownerPath,
      'assocPath': assocPath,
      'licenceExpiryDate': licenceExpiryDate,
      'policyIssueDate': policyIssueDate,
      'policyExpiryDate': policyExpiryDate,
      'cacheDate': cacheDate,
      'vehicleType': m,
      'photoList': photoList,
      'year': year,
      'operatingLicence': operatingLicence,
      'stringDate': stringDate,
      'vehicleReg': vehicleReg,
      'status': status,
      'policyNumber': policyNumber,
      'selected': selected,
      'path': path,
    };
    return map;
  }
}
