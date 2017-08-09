import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/security.dart';

import 'package:markdown/markdown.dart' as md;

import 'src/page.dart';
import 'src/factopolis_service.dart';

@Component(
  selector: 'factopolis-content',
  templateUrl: 'content_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class ContentComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;
  final ChangeDetectorRef _changeDetectorRef;
  final DomSanitizationService _domSanitizationService;

  SafeHtml contentHtml;

  ContentComponent(this._factopolisService, this._routeParams, this._changeDetectorRef,
      this._domSanitizationService);

  Future<Null> ngOnInit() async {
    Page data = await this._factopolisService.getContent(this._routeParams.get('id'));
    this._factopolisService.currentPage = data;

    contentHtml = this._domSanitizationService.bypassSecurityTrustHtml(data.contentHtml);

    this._changeDetectorRef.detectChanges();
  }
}