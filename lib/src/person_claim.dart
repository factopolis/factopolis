import 'assertion.dart';

class PersonClaim {
  final String claim;
  final List<Assertion> assertions;

  PersonClaim(this.claim, this.assertions);

  PersonClaim.fromJson(dynamic data)
    : claim = data['claim'],
      assertions = null;
}