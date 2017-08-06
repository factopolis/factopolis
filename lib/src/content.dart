import 'page.dart';

class Content extends Page {
  String content;

  Content(String slug) : super(slug);

  Content.fromJson(String slug, dynamic data) : super(slug) {
    this.parseJson(data);
  }

  void parseJson(dynamic data) {
    super.parseJson(data);
  }
}