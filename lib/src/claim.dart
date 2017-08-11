import 'package:markdown/markdown.dart' as md;

import 'page.dart';
import 'person.dart';
import 'claim_check.dart';
import 'quote.dart';

class Claim extends Page {
  final List<Person> claimants;
  final List<ClaimCheck> checks;
  final String summary;

  String _summaryHtml = null;
  String get summaryHtml {
    if (this._summaryHtml == null && this.summary != null)
      this._summaryHtml = md.markdownToHtml(this.summary);

    return this._summaryHtml;
  }

  Claim.fromJson(Map<String, dynamic> json)
    : claimants = (json['claimants'] == null) ? null : json['claimants'].where((data) {
          return data != null;
        }).map((data) {
          return new Person.fromJson(data);
        }).toList(),
      checks = (json['checks'] == null) ? null : json['checks'].map((data) {
          return new ClaimCheck.fromJson(data);
        }),
      summary = (json['summary'] == null) ? null : json['summary'],
      super.fromJson(json);
}
