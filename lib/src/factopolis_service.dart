import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/http.dart';

import 'page.dart';
import 'claim.dart';
import 'claims.dart';
import 'people.dart';
import 'person.dart';

@Injectable()
class FactopolisService {
  Client _http;

  FactopolisService(this._http);

  Future<Page> requestContent(String path) async {
    final Response response = await this._http.get(path);
    return new Page.fromJson(JSON.decode(response.body));
  }

  Future<Page> requestPage(String id) async {
    return this.requestContent("/$id/index.json");
  }

  Future<Claims> getClaims() async {
    final Response response = await this._http.get("/claim/index.json");
    return new Claims.fromJson(JSON.decode(response.body));
  }

  Future<Claims> getClaim(String id) async {
    final Response response = await this._http.get("/claim/$id/index.json");
    return new Claim.fromJson(JSON.decode(response.body));
  }

  Future<People> getPeople() async {
    final Response response = await this._http.get("/person/index.json");
    return new People.fromJson(JSON.decode(response.body));
  }

  Future<Person> getPerson(String id) async {
    final Response response = await this._http.get("/person/$id/index.json");
    return new Person.fromJson(JSON.decode(response.body));
  }
}
