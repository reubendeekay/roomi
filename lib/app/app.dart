import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:roomy/common/route/route_generator.dart';
import 'package:roomy/feature/on_boarding/on_boarding_screen.dart';
import 'package:roomy/feature/signin_signup/resources/loading.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/tenant_mode_screen.dart';
import 'package:roomy/providers/auth_provider.dart';
import 'package:roomy/providers/chat_provider.dart';
import 'package:roomy/providers/location_provider.dart';
import 'package:roomy/providers/post_provider.dart';
import 'package:roomy/providers/tenant_provider.dart';
import 'package:roomy/providers/wishlist_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocationProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => ChatProvider()),
          ChangeNotifierProvider(create: (_) => PostProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
          ChangeNotifierProvider(create: (_) => TenantProvider()),
        ],
        child: GetMaterialApp(
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          title: 'Roomy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: const Color(0xFFFFFFFF),
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            appBarTheme: const AppBarTheme(
              color: Color(0xFFFFFFFF),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InitialLoadingScreen();
                }
                return OnBoardingScreen();
              }),
        ),
      ),
    );
  }
}
