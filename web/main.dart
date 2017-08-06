import 'package:angular2/angular2.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/platform/browser.dart';
import 'package:factopolis/app_component.dart';
import 'package:http/http.dart';
import 'package:http/browser_client.dart';

void main() {
  bootstrap(AppComponent, [
    provide(Client, useFactory: () => new BrowserClient(), deps: []),
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
