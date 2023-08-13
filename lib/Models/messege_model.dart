class MessegeModel {
  String? sender;
  String? text;
  String? seen;
  String? createdon;
  MessegeModel({this.sender, this.text, this.seen, this.createdon});

  MessegeModel.fromMap(Map<String, dynamic> map) {
    sender = map['sender'];
    text = map['text'];
    seen = map['seen'];
    createdon = map['createdon'];
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'text': text,
      'seen': seen,
      'createdon': createdon
    };
  }
}
