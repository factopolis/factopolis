import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'src/factopolis_service.dart';
import 'src/person.dart';

@Component(
  selector: 'factopolis-people',
  templateUrl: 'people_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class PeopleComponent implements OnInit {
  List<Person> people;

  final FactopolisService _factopolisService;
  final ChangeDetectorRef _changeDetectorRef;

  PeopleComponent(this._factopolisService, this._changeDetectorRef);

  Future<Null> getPeople() async {
    people = await _factopolisService.getPeople();
    // this._factopolisService.currentPage = people;
  }

  Future<Null> ngOnInit() async {
    await getPeople();
    this._changeDetectorRef.detectChanges();
    return null;
  }
}