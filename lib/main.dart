import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/view/home_page.dart';
import 'package:sakila_store_project/view/login_page.dart';
import 'package:sakila_store_project/view/splash_screen.dart';
import 'package:sakila_store_project/view/transaksi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BarangBloc _barangBloc = BarangBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _barangBloc..add(GetBarangEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[100],
              foregroundColor: Colors.black,
            ),
          ),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    _barangBloc.close();
    super.dispose();
  }
}
