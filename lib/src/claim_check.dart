import 'package:markdown/markdown.dart' as md;
import 'package:angular2/security.dart';

class ClaimCheck {
  final String quote;
  final String source;
  final String name;

  SafeHtml _quoteHtml = null;
  SafeHtml get quoteHtml {
    if (this._quoteHtml == null && this.quote != null)
      this._quoteHtml = new SafeHtmlImpl(md.markdownToHtml(this.quote));

    return this._quoteHtml;
  }

  ClaimCheck.fromJson(Map<String, dynamic> json)
    : quote = (json['quote'] == null) ? json['short'] : json['quote'],
      source = json['url'],
      name = json['name'];
}
