import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_bloc.dart';
import 'package:sakila_store_project/view/home_page.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BarangBloc _barangBloc = BarangBloc();
  final PengeluaranBloc _pengeluaranBloc = PengeluaranBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _barangBloc
            ..add(
              GetBarangEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => _pengeluaranBloc
            ..add(
              GetAllPengeluaranEvent(),
            ),
        ),
      ],
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

  // @override
  // void dispose() {
  //   _barangBloc.close();
  //   super.dispose();
  // }
}
