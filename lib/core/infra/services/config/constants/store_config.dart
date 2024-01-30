import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class StoreConfig {
  StoreConfig._();

  static String? get linkForCurrentPlatform =>
      _storeLinkForCurrentPlatform(defaultTargetPlatform);

  static _storeLinkForCurrentPlatform(TargetPlatform platform) {
    String? link;
    if (kIsWeb) {
      link = StoreLinks.web.link;
    } else {
      switch (platform) {
        case TargetPlatform.iOS:
          link = StoreLinks.ios.link;
          break;
        case TargetPlatform.android:
          link = StoreLinks.android.link;
          break;
        case TargetPlatform.windows:
          link = StoreLinks.windows.link;
          break;
        case TargetPlatform.linux:
          link = StoreLinks.linux.link;
          break;
        case TargetPlatform.macOS:
          link = StoreLinks.macOS.link;
          break;
        default:
          link = null;
      }
    }
    return link;
  }
}

enum StoreLinks {
  ios,
  android,
  windows,
  linux,
  macOS,
  web;

  String? get link {
    return switch (this) {
      StoreLinks.ios => 'link para Apple Store',
      StoreLinks.android => 'link para PlayStore',
      StoreLinks.windows => null,
      StoreLinks.linux => null,
      StoreLinks.macOS => null,
      StoreLinks.web => null,
    };
  }
}
