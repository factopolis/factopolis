import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'src/factopolis_service.dart';
import 'src/person.dart';

@Component(
  selector: 'factopolis-claims',
  templateUrl: 'claim_component.html',
  directives: const [COMMON_DIRECTIVES],
  providers: const [FactopolisService],
)
class ClaimComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;

  ClaimComponent(this._factopolisService, this._routeParams);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
  }
}