class Office {
  final String name;
  final DateTime from;
  final DateTime thru;

  Office.fromJson(Map<String, dynamic> data)
    : name = data['title'],
      from = DateTime.parse(data['from']),
      thru = (data['thru'] != null) ? DateTime.parse(data['thru']) : null;
}