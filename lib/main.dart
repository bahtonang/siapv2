import 'package:flutter/material.dart';
import 'package:siap/landingpage/landingpage.dart';
import 'package:siap/constans.dart';
import 'package:siap/login.dart';
import 'package:go_router/go_router.dart';
import 'package:siap/form/sewing/mksewing.dart';
import 'package:siap/teknisi/sewing/myticketdetail.dart';
import 'package:siap/teknisi/sewing/mytiket.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return LoginPage();
        }),
    GoRoute(
      path: '/',
      name: 'menuutama',
      builder: (context, state) {
        return LandingPage();
      },
      routes: [
        GoRoute(
          path: 'mksewing/:gedung/:kodebagian/:pid/:token',
          name: 'mksewing',
          builder: (context, state) {
            return MekanikSewing(
              gedung: state.params['gedung'],
              kodebagian: state.params['kodebagian'],
              pid: state.params['pid'],
              token: state.params['token'],
            );
          },
        ),
        GoRoute(
          path: 'mytiket/:pid/:token',
          name: 'mytiket',
          builder: (context, state) {
            return MyTiket(
              nopid: state.params['pid'],
              token: state.params['token'],
            );
          },
        ),
        GoRoute(
            path: 'tiketaction/:nomor',
            name: 'tiketaction',
            builder: (context, state) {
              return MktiketDetail(notiket: state.params['nomor']);
            })
      ],
    ),
  ], initialLocation: '/login', debugLogDiagnostics: true, routerNeglect: true);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Siap',
      theme: new ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: GojekPalette.green,
      ),
      //  home: LandingPage(),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
