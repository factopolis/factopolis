import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:factopolis/claim_component.dart';
import 'package:factopolis/people_component.dart';
import 'package:factopolis/person_component.dart';
import 'package:factopolis/content_component.dart';

import 'src/factopolis_service.dart';

@Component(
  selector: 'factopolis-app',
  templateUrl: 'app_component.html',
  directives: const [COMMON_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [FactopolisService, ROUTER_PROVIDERS],
)
@RouteConfig(const [
  const Route(path: '/claim/', name: 'Claim', component: ClaimComponent),
  const Route(path: '/person/', name: 'People', component: PeopleComponent),
  const Route(path: '/person/:id/', name: 'Person', component: PersonComponent),
  const Route(path: '/:id/', name: 'Content', component: ContentComponent)
])
class AppComponent extends ComponentState implements OnInit {
  FactopolisService _factopolis;

  String title = null;

  AppComponent(this._factopolis);

  Future<Null> ngOnInit() async {
    return null;
  }
}