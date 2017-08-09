import 'page.dart';
import 'office.dart';
import 'person_claim.dart';

class Person extends Page {
  final int claimCount;
  final List<PersonClaim> claims;
  final List<Office> offices;

  Person.fromJson(Map<String, dynamic> data, [String id])
    : claimCount = data['count'],
      offices = (data['offices'] == null) ? null : data['offices'].map((o) {
        return new Office.fromJson(o);
      }).toList(),
      claims = (data['claims'] == null) ? null : data['claims'].map((o) {
        return new PersonClaim.fromJson(o);
      }).toList(),
      super.fromJson(data, id);
}
