
/*
####### Generated by JavaToDart Tue Jan 01 17:12:32 SAST 2019
####### rigged up by AM Esq.
*/

class AdvertisedId {
	String type;
	String id;
	String path;

AdvertisedId({
	this.type,
	this.id,
});

AdvertisedId.fromJson(Map data) {
	this.type = data['type'];
	this.id = data['id'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'type': type,
	'id': id,
	'path': path,
	
};

}