import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_impl/src/shop/cart/cart_controller.dart';
import 'package:provider_impl/src/shop/cart/cart_view.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_controller.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_service.dart';
import 'package:provider_impl/src/shop/catalogue/catalogue_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogueController(CatalogueService())),
        ChangeNotifierProxyProvider<CatalogueController, CartController>(
          create: (context) => CartController(),
          update: (context, catalogueController, cartController) {
            if (cartController == null) throw ArgumentError.notNull('cartController');
            cartController.catalogueController = catalogueController;
            catalogueController.loadItems();
            return cartController;
          },
        )
      ],
      child: MaterialApp(
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
                  return const CatalogueView();
                case CartView.routeName:
                  return const CartView();
                default:
                  return ErrorWidget(Exception('No such route'));
              }
            },
          );
        },
      ),
    );
  }
}
