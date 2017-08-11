import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:factopolis/app_component.dart';

import 'person.dart';
import 'factopolis_service.dart';

@Component(
  selector: 'factopolis-person',
  templateUrl: 'person_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class PersonComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final AppComponent _appComponent;
  final DomSanitizationService _domSanitizationService;

  Person person;

  PersonComponent(this._factopolisService, this._routeParams, this._appComponent, this._domSanitizationService);

  void ngOnInit() async {
    this.person = await this._factopolisService.getPerson(this._routeParams.get('id'));

    this._appComponent.currentPage = person;
  }
}
