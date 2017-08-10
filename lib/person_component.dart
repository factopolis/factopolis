import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'app_component.dart';
import 'src/factopolis_service.dart';
import 'src/person.dart';

@Component(
  selector: 'factopolis-person',
  templateUrl: 'person_component.html',
  directives: const [COMMON_DIRECTIVES]
)
class PersonComponent implements OnInit {
  Person person;

  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final ChangeDetectorRef _changeDetectorRef;
  final AppComponent _app;

  PersonComponent(this._factopolisService, this._routeParams, this._changeDetectorRef, this._app);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    this.person = await _factopolisService.getPerson(_id);
    this._factopolisService.currentPage = this.person;
    this._app.title = this.person.name;
    this._changeDetectorRef.detectChanges();
    return null;
  }
}