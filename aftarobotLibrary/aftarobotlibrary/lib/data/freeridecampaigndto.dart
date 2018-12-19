
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class FreeRideCampaignDTO {
	String freeRideCampaignID;
	String associationID;
	String associationName;
	String driverID;
	String driverName;
	String ownerName;
	String ownerID;
	int freeRideRandomizer;
	int startDate;
	int endDate;
	int freeRideMax;
	String stringStartDate;
	String stringEndDate;
	static const int ALL_FREE = 0;
	static const int NONE_FREE = 0;
	String path;

FreeRideCampaignDTO({
	this.freeRideCampaignID,
	this.associationID,
	this.associationName,
	this.driverID,
	this.driverName,
	this.ownerName,
	this.ownerID,
	this.freeRideRandomizer,
	this.startDate,
	this.endDate,
	this.freeRideMax,
	this.stringStartDate,
	this.stringEndDate,
});

FreeRideCampaignDTO.fromJson(Map data) {
	this.freeRideCampaignID = data['freeRideCampaignID'];
	this.associationID = data['associationID'];
	this.associationName = data['associationName'];
	this.driverID = data['driverID'];
	this.driverName = data['driverName'];
	this.ownerName = data['ownerName'];
	this.ownerID = data['ownerID'];
	this.freeRideRandomizer = data['freeRideRandomizer'];
	this.startDate = data['startDate'];
	this.endDate = data['endDate'];
	this.freeRideMax = data['freeRideMax'];
	this.stringStartDate = data['stringStartDate'];
	this.stringEndDate = data['stringEndDate'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'freeRideCampaignID': freeRideCampaignID,
	'associationID': associationID,
	'associationName': associationName,
	'driverID': driverID,
	'driverName': driverName,
	'ownerName': ownerName,
	'ownerID': ownerID,
	'freeRideRandomizer': freeRideRandomizer,
	'startDate': startDate,
	'endDate': endDate,
	'freeRideMax': freeRideMax,
	'stringStartDate': stringStartDate,
	'stringEndDate': stringEndDate,
	'path': path,
	
};

}