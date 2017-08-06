import 'dart:async';

import 'package:angular2/angular2.dart';

import 'src/factopolis_service.dart';
import 'src/person.dart';

@Component(
  selector: 'factopolis-people',
  template:
    '''
    <h1>People</h1>

    <ul class="content-list person-list">
      <li *ngFor="let person of people">
        <div class="content-name">
          <a href="/person/{{ person.id }}/">{{ person.name }}</a>
        </div>
        <div class="content-claim-count">
          {{ person.claimCount }} false claim<span *ngIf="person.claimCount > 1">s</span> on file.
        </div>
      </li>
    </ul>
    ''',
  directives: const [CORE_DIRECTIVES],
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