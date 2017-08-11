import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:factopolis/app_component.dart';

import 'page.dart';
import 'factopolis_service.dart';

@Component(
  selector: 'factopolis-page',
  templateUrl: 'page_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class PageComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final AppComponent _appComponent;
  final DomSanitizationService _domSanitizationService;

  Page page;

  SafeHtml contentHtml;

  PageComponent(this._factopolisService, this._routeParams, this._appComponent, this._domSanitizationService);

  void ngOnInit() async {
    Page page = await this._factopolisService.requestPage(this._routeParams.get('id'));

    this.contentHtml = this._domSanitizationService.bypassSecurityTrustHtml(page.contentHtml);
    this._appComponent.currentPage = page;
  }
}
