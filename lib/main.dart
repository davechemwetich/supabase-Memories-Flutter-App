import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dreamhacks/core/core.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://mytiztfhxfdsld.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXvZXJid2Zkc2xkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI2NzA0NzUsImV4cCI6MTk5ODI0NjQ3NX0.hmu9UcUQzkzcGrnGYJ8a4sJdwUomIj_bgEMkTT_5fP8',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);
    return MaterialApp.router(
      title: 'Memories App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: routes,
    );
  }
}
