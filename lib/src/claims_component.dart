import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:factopolis/app_component.dart';

import 'claims.dart';
import 'factopolis_service.dart';

@Component(
  selector: 'factopolis-claims',
  templateUrl: 'claims_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class ClaimsComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final AppComponent _appComponent;
  final DomSanitizationService _domSanitizationService;

  Claims claims;

  SafeHtml contentHtml;

  ClaimsComponent(this._factopolisService, this._routeParams, this._appComponent, this._domSanitizationService);

  void ngOnInit() async {
    this.claims = await this._factopolisService.getClaims();

    this._appComponent.currentPage = claims;
  }
}
