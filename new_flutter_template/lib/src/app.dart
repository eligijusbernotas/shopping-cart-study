import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_flutter_template/src/shop/cart/cart_controller.dart';
import 'package:new_flutter_template/src/shop/cart/cart_view.dart';
import 'package:new_flutter_template/src/shop/catalogue/catalogue_controller.dart';
import 'package:new_flutter_template/src/shop/catalogue/catalogue_service.dart';
import 'package:new_flutter_template/src/shop/catalogue/catalogue_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _catalogueController = CatalogueController(CatalogueService());
  final _cartController = CartController(CatalogueService());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      initialRoute: CatalogueView.routeName,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case CatalogueView.routeName:
                return CatalogueView(controller: _catalogueController, cartController: _cartController);
              case CartView.routeName:
                return CartView(controller: _cartController);
              default:
                return ErrorWidget(Exception('No such route'));
            }
          },
        );
      },
    );
  }
}
