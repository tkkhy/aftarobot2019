
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class ExpiredRequestDTO {
	String expiredRequestID;
	String commuterRequestID;
	String userID;
	String stringDate;
	int date;
	double latitude;
	double longitude;
	int expiredByMinutes;
	String path;

ExpiredRequestDTO({
	this.expiredRequestID,
	this.commuterRequestID,
	this.userID,
	this.stringDate,
	this.date,
	this.latitude,
	this.longitude,
	this.expiredByMinutes,
});

ExpiredRequestDTO.fromJson(Map data) {
	this.expiredRequestID = data['expiredRequestID'];
	this.commuterRequestID = data['commuterRequestID'];
	this.userID = data['userID'];
	this.stringDate = data['stringDate'];
	this.date = data['date'];
	this.latitude = data['latitude'];
	this.longitude = data['longitude'];
	this.expiredByMinutes = data['expiredByMinutes'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'expiredRequestID': expiredRequestID,
	'commuterRequestID': commuterRequestID,
	'userID': userID,
	'stringDate': stringDate,
	'date': date,
	'latitude': latitude,
	'longitude': longitude,
	'expiredByMinutes': expiredByMinutes,
	'path': path,
	
};

}