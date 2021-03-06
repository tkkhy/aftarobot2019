
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class CommuterFinishedDrivingDTO {
	String userID;
	String vehicleID;
	String vehicleReg;
	String make;
	String model;
	String stringDate;
	double latitude;
	double longitude;
	int date;
	String path;

CommuterFinishedDrivingDTO({
	this.userID,
	this.vehicleID,
	this.vehicleReg,
	this.make,
	this.model,
	this.stringDate,
	this.latitude,
	this.longitude,
	this.date,
});

CommuterFinishedDrivingDTO.fromJson(Map data) {
	this.userID = data['userID'];
	this.vehicleID = data['vehicleID'];
	this.vehicleReg = data['vehicleReg'];
	this.make = data['make'];
	this.model = data['model'];
	this.stringDate = data['stringDate'];
	this.latitude = data['latitude'];
	this.longitude = data['longitude'];
	this.date = data['date'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'userID': userID,
	'vehicleID': vehicleID,
	'vehicleReg': vehicleReg,
	'make': make,
	'model': model,
	'stringDate': stringDate,
	'latitude': latitude,
	'longitude': longitude,
	'date': date,
	'path': path,
	
};

}