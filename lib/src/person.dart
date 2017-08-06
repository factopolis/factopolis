import 'person_claim.dart';

class Person {
  final String id;
  final String name;
  final int claimCount;
  List<PersonClaim> claims;

  Person(this.id, this.name, this.claimCount);

  factory Person.fromJson(Map<String, dynamic> person) {
    var res = new Person(person['id'], person['name'], person['count']);
    return res;
  }

  factory Person.fromDetailedJson(String id, Map<String, dynamic> person) {
    var res = new Person(id, person['name'], person['claims'].length);
    res.claims = person['claims'].map((claim) {
      return new PersonClaim.fromJson(claim['claim'], claim['assertions']);
    }).toList();
    return res;
  }
}
