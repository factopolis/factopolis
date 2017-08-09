import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:markdown/markdown.dart' as md;

import 'src/content.dart';
import 'src/factopolis_service.dart';

@Component(
  selector: 'factopolis-content',
  templateUrl: 'content_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [FactopolisService],
)
class ContentComponent implements OnInit {
  final FactopolisService _factopolisService;
  final RouteParams _routeParams;

  String content;

  ContentComponent(this._factopolisService, this._routeParams);

  Future<Null> ngOnInit() async {
    var data = await this._factopolisService.getContent(this._routeParams.get('id'));
    content = data.contentHtml;

    this._factopolisService.currentPage = data;
  }
}