import 'dart:io';

class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('https://booksdemo.herokuapp.com');
  static final Env staging = Env('https://booksdemo.herokuapp.com');
  static final Env production = Env('https://booksdemo.herokuapp.com');
  static const String policy = 'https://timivietnam.github.io/stacy/policy';
  static const String terms = 'https://timivietnam.github.io/stacy/term';
}

class AdHelper {
  String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6106751649082059/1981180099';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError('Unsupported platform');
  }
}