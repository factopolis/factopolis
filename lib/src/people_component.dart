import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:factopolis/app_component.dart';

import 'people.dart';
import 'factopolis_service.dart';

@Component(
  selector: 'factopolis-people',
  templateUrl: 'people_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class PeopleComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final AppComponent _appComponent;
  final DomSanitizationService _domSanitizationService;

  People people;

  SafeHtml contentHtml;

  PeopleComponent(this._factopolisService, this._routeParams, this._appComponent, this._domSanitizationService);

  void ngOnInit() async {
    this.people = await this._factopolisService.getPeople();

    this._appComponent.currentPage = people;
  }
}
