class Message {
  final String content;
  final String createdAt;

  Message(this.content, this.createdAt);

  Message.fromJson(Map<String, dynamic> json)
      : content = json["content"],
        createdAt = json["created_at"];
}
