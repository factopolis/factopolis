import 'quote.dart';

class QuoteSet {
  String claimId;
  List<Quote> quotes = new List<Quote>();

  QuoteSet(this.claimId, this.quotes);
}