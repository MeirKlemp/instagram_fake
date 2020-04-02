import 'package:flutter/material.dart';
import 'package:instagram_fake/models/users.dart';
import 'package:instagram_fake/pages/first_load.dart';
import 'package:instagram_fake/pages/home.dart';
import 'package:instagram_fake/pages/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    Users.init();
    return MaterialApp(
        title: 'Instagram',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return FadePageRoute(
                builder: (_) => Start(),
                settings: settings,
              );
            case '/home':
              return FadePageRoute(
                builder: (_) => Home(),
                settings: settings,
              );
            // main route '/'
            default:
              return FadePageRoute(
                builder: (_) => FirstLoad(),
                settings: settings,
              );
          }
        });
  }
}

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes.
    return new FadeTransition(opacity: animation, child: child);
  }
}
