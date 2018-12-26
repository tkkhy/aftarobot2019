/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

import 'package:aftarobotlibrary/data/spatialinfodto.dart';
import 'package:aftarobotlibrary/data/userdto.dart';

class RouteDTO {
  String routeID;
  String associationID;
  String countryID;
  String provinceID;
  String cityID;
  String name;
  String status;
  String associationName;
  String cityName;
  String countryName;
  String routeNumber;
  String stringDate;
  String color;
  int date;
  int cacheDate;
  UserDTO user;
  UserDTO routeBuilder;
  String path;
  List<SpatialInfoDTO> spatialInfos;

  RouteDTO({
    this.routeID,
    this.associationID,
    this.countryID,
    this.provinceID,
    this.cityID,
    this.name,
    this.status,
    this.associationName,
    this.cityName,
    this.countryName,
    this.routeNumber,
    this.stringDate,
    this.color,
    this.date,
    this.cacheDate,
    this.routeBuilder,
    this.spatialInfos,
  });

  RouteDTO.fromJson(Map data) {
    this.routeID = data['routeID'];
    this.associationID = data['associationID'];
    this.countryID = data['countryID'];
    this.provinceID = data['provinceID'];
    this.cityID = data['cityID'];
    this.name = data['name'];
    this.status = data['status'];
    this.associationName = data['associationName'];
    this.cityName = data['cityName'];
    this.countryName = data['countryName'];
    this.routeNumber = data['routeNumber'];
    this.stringDate = data['stringDate'];
    this.color = data['color'];
    this.date = data['date'];
    this.cacheDate = data['cacheDate'];
    if (data['routeBuilder'] != null) {
      var map = data['routeBuilder'];
      this.routeBuilder = UserDTO.fromJson(map);
    }
//    this.landmarks = data['landmarks'];

    this.spatialInfos = List();
    try {
      if (data['spatialInfos'] != null) {
        Map<dynamic, dynamic> spats = data['spatialInfos'];
        spats.forEach((key, value) {
          SpatialInfoDTO spatialInfo = SpatialInfoDTO.fromJson(value);
          this.spatialInfos.add(spatialInfo);
        });
      }
    } catch (e) {
//      print(
//          'RouteDTO.fromJson --- FALLING DOWN HERE! $e. Trying Firestore format ...');
      List spats = data['spatialInfos'];
      spats.forEach((value) {
        SpatialInfoDTO spatialInfo = SpatialInfoDTO.fromJson(value);
        this.spatialInfos.add(spatialInfo);
      });
//      print('RouteDTO.fromJson, Firestore format worked OK');
    }

    this.path = data['path'];
  }

  Map<String, dynamic> toJson() {
    var rbMap;
    if (routeBuilder != null) {
      rbMap = routeBuilder.toJson();
    }
    List mInfos = List<Map<String, dynamic>>();
    if (spatialInfos != null && spatialInfos.isNotEmpty) {
      spatialInfos.forEach((si) {
        var m = si.toJson();
        mInfos.add(m);
      });
    }
    Map<String, dynamic> map = {
      'routeID': routeID,
      'associationID': associationID,
      'countryID': countryID,
      'provinceID': provinceID,
      'cityID': cityID,
      'name': name,
      'status': status,
      'associationName': associationName,
      'cityName': cityName,
      'countryName': countryName,
      'routeNumber': routeNumber,
      'stringDate': stringDate,
      'color': color,
      'date': date,
      'cacheDate': cacheDate,
      'routeBuilder': rbMap,
      'spatialInfos': mInfos,
      'path': path,
    };
    return map;
  }
}
