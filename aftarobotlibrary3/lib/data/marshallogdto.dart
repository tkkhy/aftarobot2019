
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class MarshalLogDTO {
	int marshalLogID;
	int marshalID;
	int landmarkID;
	int loginDate;
	int logoutDate;
	String status;
	double latitude;
	double longitude;
	String path;

MarshalLogDTO({
	this.marshalLogID,
	this.marshalID,
	this.landmarkID,
	this.loginDate,
	this.logoutDate,
	this.status,
	this.latitude,
	this.longitude,
});

MarshalLogDTO.fromJson(Map data) {
	this.marshalLogID = data['marshalLogID'];
	this.marshalID = data['marshalID'];
	this.landmarkID = data['landmarkID'];
	this.loginDate = data['loginDate'];
	this.logoutDate = data['logoutDate'];
	this.status = data['status'];
	this.latitude = data['latitude'];
	this.longitude = data['longitude'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'marshalLogID': marshalLogID,
	'marshalID': marshalID,
	'landmarkID': landmarkID,
	'loginDate': loginDate,
	'logoutDate': logoutDate,
	'status': status,
	'latitude': latitude,
	'longitude': longitude,
	'path': path,
	
};

}