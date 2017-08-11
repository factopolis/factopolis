import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:factopolis/app_component.dart';

import 'claim.dart';
import 'factopolis_service.dart';

@Component(
  selector: 'factopolis-claim',
  templateUrl: 'claim_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class ClaimComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final AppComponent _appComponent;
  final DomSanitizationService _domSanitizationService;

  Claim claim;

  ClaimComponent(this._factopolisService, this._routeParams, this._appComponent, this._domSanitizationService);

  void ngOnInit() async {
    this.claim = await this._factopolisService.getClaim(this._routeParams.get('id'));

    this._appComponent.currentPage = claim;
  }
}
