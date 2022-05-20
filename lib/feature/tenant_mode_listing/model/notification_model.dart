class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String imgAvt;

  NotificationModel({this.id, this.title, this.content, this.imgAvt});

  Map<String, dynamic> toJosn() {
    return {'title': title, 'content': content, 'imgAvt': imgAvt};
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        title: json['title'], content: json['content'], imgAvt: json['imgAvt']);
  }
}
