import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'src/factopolis_service.dart';
import 'src/person.dart';

@Component(
  selector: 'factopolis-people',
  templateUrl: 'people_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [FactopolisService],
)
class PeopleComponent implements OnInit {
  List<Person> people;

  final FactopolisService _factopolisService;
  PeopleComponent(this._factopolisService);

  Future<Null> getPeople() async {
    people = await _factopolisService.getPeople();
  }

  void ngOnInit() {
    getPeople();
  }
}