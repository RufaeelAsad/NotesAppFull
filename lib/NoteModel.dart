/// _id : "63f91928910dd8f9eed46f66"
/// userid : "talha@gmail.com"
/// tittle : "Talha"
/// content : "this is talha content"
/// __v : 0

class NoteModel {
  NoteModel({
      String? id, 
      String? userid, 
      String? tittle, 
      String? content, 
      num? v,}){
    _id = id;
    _userid = userid;
    _tittle = tittle;
    _content = content;
    _v = v;
}

  NoteModel.fromJson(dynamic json) {
    _id = json['_id'];
    _userid = json['userid'];
    _tittle = json['tittle'];
    _content = json['content'];
    _v = json['__v'];
  }
  String? _id;
  String? _userid;
  String? _tittle;
  String? _content;
  num? _v;
NoteModel copyWith({  String? id,
  String? userid,
  String? tittle,
  String? content,
  num? v,
}) => NoteModel(  id: id ?? _id,
  userid: userid ?? _userid,
  tittle: tittle ?? _tittle,
  content: content ?? _content,
  v: v ?? _v,
);
  String? get id => _id;
  String? get userid => _userid;
  String? get tittle => _tittle;
  String? get content => _content;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['userid'] = _userid;
    map['tittle'] = _tittle;
    map['content'] = _content;
    map['__v'] = _v;
    return map;
  }

}