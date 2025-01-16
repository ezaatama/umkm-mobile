import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umkm/utils/binding.dart';
import 'package:umkm/utils/constant.dart';
import 'package:umkm/utils/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(appRoute: AppRoute()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRoute,
  });

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'UMKM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // fontFamily: GoogleFonts(),
        colorScheme: ColorScheme.fromSeed(seedColor: ColorUI.PRIMARY),
      ),
      onGenerateRoute: appRoute.onGenerateRoute,
    );
  }
}
