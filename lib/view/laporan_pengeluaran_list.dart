import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_bloc.dart';

class LaporanPengeluaranPage extends StatelessWidget {
  const LaporanPengeluaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
        create: (context) => PengeluaranBloc()..add(GetAllPengeluaranEvent()),
        child: BlocBuilder<PengeluaranBloc, PengeluaranState>(
          builder: (context, state) {
            if (state is PengeluaranLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PengeluaranLoaded) {
              return ListView.builder(
                  itemCount: state.pengeluaran.length,
                  itemBuilder: (context, index) {
                    int tanggal =
                        state.pengeluaran[index].tanggalPengeluaran.day;
                    int tahun =
                        state.pengeluaran[index].tanggalPengeluaran.year;
                    int bulan =
                        state.pengeluaran[index].tanggalPengeluaran.month;
                    return Container(child: Container());
                  });
            }
            return Container();
          },
        ),
      ),
    ));
  }
}
