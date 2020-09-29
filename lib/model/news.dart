import 'package:api_example_two/model/message.dart';
import 'package:api_example_two/model/user.dart';

class News {
  final User user;
  final Message message;

  News(this.user, this.message);

  News.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json["user"]),
        message = Message.fromJson(json["message"]);
}
