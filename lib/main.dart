import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:production_pool/router/routing_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  //URLの末尾の#を消すため
  setPathUrlStrategy();
  await Supabase.initialize(
    url: dotenv.get('VAR_URL'), // .envのURLを取得.
    anonKey: dotenv.get('VAR_ANONKEY'), // .envのanonキーを取得.
  );
  // //Initialized
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   FormB
      // ],
      // supportedLocales: const [Locale('ja'), Locale('en')],
      // theme: lightModelTheme(),
      // routerConfig: ref.watch(provider),
      routerConfig: ref.watch(routingProvider),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
