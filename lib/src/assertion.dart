class Assertion {
  final DateTime date;
  final Uri source;

  Assertion(this.date, this.source);

  factory Assertion.fromJson(Map<String, dynamic> assertion) {
    var ass = new Assertion(
      DateTime.parse(assertion['date']),
      Uri.parse(assertion['source'])
    );
    return ass;
  }
}