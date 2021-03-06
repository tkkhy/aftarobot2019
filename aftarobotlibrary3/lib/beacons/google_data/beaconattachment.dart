
/*
####### Generated by JavaToDart Tue Jan 01 17:12:32 SAST 2019
####### rigged up by AM Esq.
*/

class BeaconAttachment {
	String attachmentName;
	String namespacedType;
	String data;
	String creationTimeMs;
	String path;

BeaconAttachment({
	this.attachmentName,
	this.namespacedType,
	this.data,
	this.creationTimeMs,
});

BeaconAttachment.fromJson(Map data) {
	this.attachmentName = data['attachmentName'];
	this.namespacedType = data['namespacedType'];
	this.data = data['data'];
	this.creationTimeMs = data['creationTimeMs'];
	this.path = data['path'];
}

Map<String, dynamic> toJson() => <String, dynamic>{
	'attachmentName': attachmentName,
	'namespacedType': namespacedType,
	'data': data,
	'creationTimeMs': creationTimeMs,
	'path': path,
	
};

}