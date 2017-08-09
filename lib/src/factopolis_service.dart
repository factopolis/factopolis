import 'dart:async';
import 'dart:convert';

import 'package:angular2/angular2.dart';
import 'package:http/http.dart';

import 'page.dart';
import 'content.dart';
import 'person.dart';

@Injectable()
class FactopolisService {
  Client _http;
  ChangeDetectorRef _changeDetectorRef;

  // For communicating current status with AppComponent
  Page _currentPage = null;
  set currentPage (Page value) {
    this._currentPage = value;
    this._changeDetectorRef.detectChanges();
  }
  Page get currentPage {
    return this._currentPage;
  }

  FactopolisService(this._http, this._changeDetectorRef);

  Future<Response> _request (String url) {
    return _http.get(url);
  }

  Future<Content> getContent(String id) async {
    final Response response = await this._request("/$id/index.json");
    return new Content.fromJson(JSON.decode(response.body), id);
  }

  Future<List<Person>> getPeople() async {
    final response = await this._request("/person/index.json");
    return JSON.decode(response.body)['people'].map((json) {
      return new Person.fromJson(json);
    }).toList();
  }

  Future<Person> getPerson(String id) async {
    final response = await this._request("/person/$id/index.json");
    return new Person.fromJson(JSON.decode(response.body), id);
  }
}