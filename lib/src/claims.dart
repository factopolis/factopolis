import 'page.dart';
import 'claim.dart';

class Claims extends Page {
  final int count;
  final List<Claim> claims;

  Claims.fromJson(Map<String, dynamic> json)
    : claims = (json['claims'] == null) ? null : json['claims'].map((data) {
        return new Claim.fromJson(data);
      }).toList(),
      count = (json['claims'] == null) ? 0 : json['claims'].length,
      super.fromJson(json);
}
