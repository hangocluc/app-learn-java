class Topics {
  String? sId;
  String? lessonId;
  String? title;
  String? content;

  Topics({this.sId, this.lessonId, this.title, this.content});

  Topics.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lessonId = json['lessonId'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['lessonId'] = lessonId;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
