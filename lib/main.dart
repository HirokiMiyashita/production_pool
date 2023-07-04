import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production_pool/router/routing_provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  //URLの末尾の#を消すため
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBVxakyR_Ipk-Y3NHQuvesxdmNm5D3bycA",
        appId: "1:872023988105:web:b08f0cb00f20f982163358",
        messagingSenderId: "872023988105",
        projectId: "pool-a2005"),
  );
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routingProvider),
    );
  }
}
