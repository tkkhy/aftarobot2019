import 'package:aftarobotlibrary/data/userdto.dart';
import 'package:aftarobotlibrary/data/vehicledto.dart';

/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class FreeRideVoucherDTO {
	String freeRideVoucherID;
	String associationID;
	String userID;
	String stringVoucherDate;
	String freeRideCampaignID;
	String driverID;
	String driverName;
	String userEmail;
	String marshalID;
	String marshalName;
	String vehicleID;
	String vehicleReg;
	String stringDateRegistered;
	String routeID;
	String routeName;
	String stringDateRedeemed;
	String userFCMtoken;
	String driverFCMToken;
	UserDTO user;
	VehicleDTO vehicle;
	int pickUpDate;
	int voucherDate;
	int dateRegistered;
	int dateRedeemed;
	bool redeemed;
	int numberOfRequests;
	int totalPassengers;
	String path;

FreeRideVoucherDTO({
	this.freeRideVoucherID,
	this.associationID,
	this.userID,
	this.stringVoucherDate,
	this.freeRideCampaignID,
	this.driverID,
	this.driverName,
	this.userEmail,
	this.marshalID,
	this.marshalName,
	this.vehicleID,
	this.vehicleReg,
	this.stringDateRegistered,
	this.routeID,
	this.routeName,
	this.stringDateRedeemed,
	this.userFCMtoken,
	this.driverFCMToken,
	this.user,
	this.vehicle,
	this.pickUpDate,
	this.voucherDate,
	this.dateRegistered,
	this.dateRedeemed,
	this.redeemed,
	this.numberOfRequests,
	this.totalPassengers,
});

FreeRideVoucherDTO.fromJson(Map data) {
	this.freeRideVoucherID = data['freeRideVoucherID'];
	this.associationID = data['associationID'];
	this.userID = data['userID'];
	this.stringVoucherDate = data['stringVoucherDate'];
	this.freeRideCampaignID = data['freeRideCampaignID'];
	this.driverID = data['driverID'];
	this.driverName = data['driverName'];
	this.userEmail = data['userEmail'];
	this.marshalID = data['marshalID'];
	this.marshalName = data['marshalName'];
	this.vehicleID = data['vehicleID'];
	this.vehicleReg = data['vehicleReg'];
	this.stringDateRegistered = data['stringDateRegistered'];
	this.routeID = data['routeID'];
	this.routeName = data['routeName'];
	this.stringDateRedeemed = data['stringDateRedeemed'];
	this.userFCMtoken = data['userFCMtoken'];
	this.driverFCMToken = data['driverFCMToken'];
	this.user = data['user'];
	this.vehicle = data['vehicle'];
	this.pickUpDate = data['pickUpDate'];
	this.voucherDate = data['voucherDate'];
	this.dateRegistered = data['dateRegistered'];
	this.dateRedeemed = data['dateRedeemed'];
	this.redeemed = data['redeemed'];
	this.numberOfRequests = data['numberOfRequests'];
	this.totalPassengers = data['totalPassengers'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'freeRideVoucherID': freeRideVoucherID,
	'associationID': associationID,
	'userID': userID,
	'stringVoucherDate': stringVoucherDate,
	'freeRideCampaignID': freeRideCampaignID,
	'driverID': driverID,
	'driverName': driverName,
	'userEmail': userEmail,
	'marshalID': marshalID,
	'marshalName': marshalName,
	'vehicleID': vehicleID,
	'vehicleReg': vehicleReg,
	'stringDateRegistered': stringDateRegistered,
	'routeID': routeID,
	'routeName': routeName,
	'stringDateRedeemed': stringDateRedeemed,
	'userFCMtoken': userFCMtoken,
	'driverFCMToken': driverFCMToken,
	'user': user,
	'vehicle': vehicle,
	'pickUpDate': pickUpDate,
	'voucherDate': voucherDate,
	'dateRegistered': dateRegistered,
	'dateRedeemed': dateRedeemed,
	'redeemed': redeemed,
	'numberOfRequests': numberOfRequests,
	'totalPassengers': totalPassengers,
	'path': path,
	
};

}