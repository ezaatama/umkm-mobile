import 'package:flutter/material.dart';
import 'package:umkm/view/onboarding/splash_screen.dart';
import 'package:umkm/view/registration/identitas_diri_screen.dart';
import 'package:umkm/view/registration/informasi_lain_screen.dart';
import 'package:umkm/view/registration/jenis_usaha_screen.dart';
import 'package:umkm/view/registration/pekerjaan_finansial_screen.dart';
import 'package:umkm/view/registration/registration_screen.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case '/identitas-diri':
        return MaterialPageRoute(builder: (_) => const IdentitasDiriScreen());
      case '/informasi-lain':
        return MaterialPageRoute(builder: (_) => const InformasiLainScreen());
      case '/pekerjaan-finansial':
        return MaterialPageRoute(
            builder: (_) => const PekerjaanFinansialScreen());
      case '/jenis-usaha':
        return MaterialPageRoute(builder: (_) => const JenisUsahaScreen());
      default:
        return _routeError();
    }
  }

  static Route _routeError() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text("Something went wrong!"),
              ),
            ));
  }
}
