import 'page.dart';
import 'person.dart';

class People extends Page {
  final int count;
  final List<Person> people;

  People.fromJson(Map<String, dynamic> json)
    : people = (json['people'] == null) ? null : json['people'].map((data) {
        return new Person.fromJson(data);
      }).toList(),
      count = (json['people'] == null) ? 0 : json['people'].length,
      super.fromJson(json);
}
