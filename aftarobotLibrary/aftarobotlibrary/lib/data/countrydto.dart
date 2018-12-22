/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

import 'package:aftarobotlibrary/data/citydto.dart';

class CountryDTO {
  String countryID;
  String name;
  String status;
  double latitude;
  double longitude;
  int date;
  List provinceList;
  List vehicleTypeList;
  List<CityDTO> cities;
  String path;

  CountryDTO({
    this.countryID,
    this.name,
    this.status,
    this.latitude,
    this.longitude,
    this.date,
    this.cities,
    this.provinceList,
    this.vehicleTypeList,
  });

  CountryDTO.fromJson(Map data) {
    this.countryID = data['countryID'];
    this.name = data['name'];
    this.status = data['status'];
    this.latitude = data['latitude'];
    this.longitude = data['longitude'];
    this.date = data['date'];
    this.provinceList = data['provinceList'];
    this.vehicleTypeList = data['vehicleTypeList'];
    this.cities = List();
    if (data['cities'] != null) {
      List mc = data['cities'];
      mc.forEach((m) {
        this.cities.add(CityDTO.fromJson(m));
      });
    }
    this.path = data['path'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> mapx = Map();
    if (this.cities.isNotEmpty) {
      this.cities.forEach((c) {
        mapx['${c.cityID}'] = c.toJson();
      });
    }
    var map = {
      'countryID': countryID,
      'name': name,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
      'date': date,
      'cities': mapx,
      'provinceList': provinceList,
      'vehicleTypeList': vehicleTypeList,
      'path': path,
    };
    return map;
  }
}
