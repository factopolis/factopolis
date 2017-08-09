class Assertion {
  final DateTime date;
  final Uri source;

  Assertion.fromJson(Map<String, dynamic> data)
    : date = DateTime.parse(data['date']),
      source = Uri.parse(data['source']);
}