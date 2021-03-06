
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class FCMData {
	String fromUser;
	String message;
	String title;
	String announcementID;
	String userID;
	String json;
	int date;
	int expiryDate;
	int messageType;
	static const int ANNOUNCEMENT = 0;
	static const int TRIP = 0;
	static const int INCIDENT = 0;
	static const int WELCOME = 0;
	static const int OTHER = 0;
	static const int COMMUTER_REQUEST = 0;
	static const int VEHICLE_LOCATION_REQUEST = 0;
	static const int VEHICLE_LOCATION_REQUEST_RESPONSE = 0;
	static const int RATING = 0;
	static const int ROUTE_UPDATE_TRIGGER = 0;
	static const int ROUTE_BUILDER_MESSAGE = 0;
	static const int ROUTE_ADDED = 0;
	static const int LANDMARK_ADDED = 0;
	static const int ROUTE_BUILDER_LOCATION_REQUEST = 0;
	static const int ROUTE_BUILDER_LOCATION_RESPONSE = 0;
	static const int USER_ADDED = 0;
	static const int ROUTE_DELETED = 0;
	static const int ROUTE_UPDATED = 0;
	static const int LANDMARK_DELETED = 0;
	static const int LANDMARK_UPDATED = 0;
	static const int FREE_RIDE_VOUCHER = 0;
	static const int FREE_RIDE_VOUCHER_REDEEMED = 0;
	static const int PICK_UP = 0;
	static const int PANIC = 0;
	static const int PANIC_OVER = 0;
	static const int MOVING_VEHICLE = 0;
	static const int MOVING_COMMUTER = 0;
	static const int HEART_BEAT = 0;
	static const int STOPPING_VEHICLE = 0;
	static const int TAXI_FEES = 0;
	static const int HYPERTRACK_TRIP_STARTED = 0;
	static const int HYPERTRACK_TRIP_ENDED = 0;
	static const int HYPERTRACK_STOP_STARTED = 0;
	static const int HYPERTRACK_STOP_ENDED = 0;
	static const int HYPERTRACK_USER_EVENT = 0;
	static const int PROBLEM_RESOLVED = 0;
	String path;

FCMData({
	this.fromUser,
	this.message,
	this.title,
	this.announcementID,
	this.userID,
	this.json,
	this.date,
	this.expiryDate,
	this.messageType,
});

FCMData.fromJson(Map data) {
	this.fromUser = data['fromUser'];
	this.message = data['message'];
	this.title = data['title'];
	this.announcementID = data['announcementID'];
	this.userID = data['userID'];
	this.json = data['json'];
	this.date = data['date'];
	this.expiryDate = data['expiryDate'];
	this.messageType = data['messageType'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'fromUser': fromUser,
	'message': message,
	'title': title,
	'announcementID': announcementID,
	'userID': userID,
	'json': json,
	'date': date,
	'expiryDate': expiryDate,
	'messageType': messageType,
	'path': path,
	
};

}