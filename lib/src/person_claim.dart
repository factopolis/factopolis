import 'assertion.dart';

class PersonClaim {
  final String claim;
  final List<Assertion> assertions;

  PersonClaim(this.claim, this.assertions);

  factory PersonClaim.fromJson(String id, List<dynamic> assertions) {
    return new PersonClaim(id, assertions.map((assertion) {
      return new Assertion.fromJson(assertion);
    }).toList());
  }
}