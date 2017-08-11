import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'src/factopolis_service.dart';
import 'src/page_component.dart';
import 'src/claims_component.dart';
import 'src/claim_component.dart';
import 'src/people_component.dart';
import 'src/person_component.dart';
import 'src/page.dart';

@Component(
  selector: 'factopolis-app',
  templateUrl: 'app_component.html',
  directives: const [COMMON_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [FactopolisService, ROUTER_PROVIDERS],
)
@RouteConfig(const [
  const Route(path: '/claim/', name: 'Claims', component: ClaimsComponent),
  const Route(path: '/claim/:id/', name: 'Claim', component: ClaimComponent),
  const Route(path: '/person/', name: 'People', component: PeopleComponent),
  const Route(path: '/person/:id/', name: 'Person', component: PersonComponent),
  // const Route(path: '/theme/', name: 'Themes', component: PageComponent),
  // const Route(path: '/theme/:id/', name: 'Theme', component: PageComponent),
  const Route(path: '/:id/', name: 'Page', component: PageComponent)
])
class AppComponent implements OnInit {
  FactopolisService _factopolis;
  Page currentPage = null;

  AppComponent(this._factopolis);

  Future<Null> ngOnInit() async {
    return null;
  }
}