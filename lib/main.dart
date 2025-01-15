import 'package:Thimar/core/utils/app_router.dart';
 import 'package:flutter/material.dart';

void main() {
  runApp(const Thimar());
}

class Thimar extends StatelessWidget {
  const Thimar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        
      ),
       routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
       
      
    );
  }
}
