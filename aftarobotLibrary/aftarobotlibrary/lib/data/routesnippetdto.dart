
/*
####### Generated by JavaToDart Wed Dec 19 22:12:26 SAST 2018
####### rigged up by AM Esq.
*/

class RouteSnippetDTO {
	String routeID;
	String routeName;
	String cityID;
	String cityName;
	String nickName;
	String path;

RouteSnippetDTO({
	this.routeID,
	this.routeName,
	this.cityID,
	this.cityName,
	this.nickName,
});

RouteSnippetDTO.fromJson(Map data) {
	this.routeID = data['routeID'];
	this.routeName = data['routeName'];
	this.cityID = data['cityID'];
	this.cityName = data['cityName'];
	this.nickName = data['nickName'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'routeID': routeID,
	'routeName': routeName,
	'cityID': cityID,
	'cityName': cityName,
	'nickName': nickName,
	'path': path,
	
};

}