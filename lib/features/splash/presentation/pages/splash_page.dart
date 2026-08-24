import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 4),
      () {
        context.go('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Color(0xfffffff),
      )
          //Image.network(
          //  "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmttaHdxMTBqenJrYmhzNnJhbnVmeWhhanZ6YWVjYzk4NWd6NG1waiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/wvtt4mtViPOSrLYNFh/giphy.gif")
          //  NetworkImage("https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmttaHdxMTBqenJrYmhzNnJhbnVmeWhhanZ6YWVjYzk4NWd6NG1waiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/wvtt4mtViPOSrLYNFh/giphy.gif"),
          ),
    );
  }
}
