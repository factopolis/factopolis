import 'page.dart';
import 'quote.dart';
import 'quote_set.dart';

class Person extends Page {
  final int count;
  final String position;

  List<Quote> quotes = new List<Quote>();
  Map<String, List<Quote>> claim_map = new Map<String, List<Quote>>();
  List<QuoteSet> claims = new List<QuoteSet>();

  Person.fromJson(Map<String, dynamic> json)
    : count = (json['count'] == null) ? null : json['count'],
      position = (json['position'] == null) ? null : json['position'],
      super.fromJson(json) {
    if (json['claims'] != null) {
      json['claims'].forEach((claim) {
        quotes.addAll(claim['assertions'].map((assertion) {
          return new Quote([claim['claim']], assertion['date'], assertion['source'], assertion['quote']);
        }));
      });

      this.quotes.forEach((quote) {
        quote.claims.forEach((claimId) {
          List<Quote> ql = this.claim_map[claimId];
          if (ql == null)
            this.claim_map[claimId] = ql = new List<Quote>();
          ql.add(quote);
        });
      });

      this.claim_map.forEach((id, quotes) {
        this.claims.add(new QuoteSet(id, quotes));
      });
    }
  }
}
