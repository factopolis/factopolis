class Quote {
  final List<String> claims;
  final DateTime date;
  final Uri source;
  final String quote;

  Quote(List<String> claims, String date, String source, String quote)
    : claims = claims,
      date = DateTime.parse(date),
      source = Uri.parse(source),
      quote = quote;

  Quote.fromJson(Map<String, dynamic> json, String claimId)
    : claims = [claimId],
      date = DateTime.parse(json['date']),
      source = Uri.parse(json['source']),
      quote = json['quote'] {
    print(json);
  }
}