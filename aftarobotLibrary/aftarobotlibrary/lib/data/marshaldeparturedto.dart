import 'package:aftarobotlibrary/data/devicedto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class MarshalDepartureDTO {
	String departureID;
	String landmarkID;
	String landmarkName;
	String userID;
	String cityID;
	String cityName;
	String routeID;
	String countryID;
	int dateDeparted;
	String stringDate;
	DeviceDTO device;
	String path;

MarshalDepartureDTO({
	this.departureID,
	this.landmarkID,
	this.landmarkName,
	this.userID,
	this.cityID,
	this.cityName,
	this.routeID,
	this.countryID,
	this.dateDeparted,
	this.stringDate,
	this.device,
});

MarshalDepartureDTO.fromJson(Map data) {
	this.departureID = data['departureID'];
	this.landmarkID = data['landmarkID'];
	this.landmarkName = data['landmarkName'];
	this.userID = data['userID'];
	this.cityID = data['cityID'];
	this.cityName = data['cityName'];
	this.routeID = data['routeID'];
	this.countryID = data['countryID'];
	this.dateDeparted = data['dateDeparted'];
	this.stringDate = data['stringDate'];
	this.device = data['device'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'departureID': departureID,
	'landmarkID': landmarkID,
	'landmarkName': landmarkName,
	'userID': userID,
	'cityID': cityID,
	'cityName': cityName,
	'routeID': routeID,
	'countryID': countryID,
	'dateDeparted': dateDeparted,
	'stringDate': stringDate,
	'device': device,
	'path': path,
	
};

}