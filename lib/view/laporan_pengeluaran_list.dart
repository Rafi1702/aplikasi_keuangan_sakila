import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_state.dart';

import 'package:sakila_store_project/view/detail_pengeluaran_page.dart';

class LaporanPengeluaranPage extends StatelessWidget {
  const LaporanPengeluaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: BlocBuilder<PengeluaranBloc, PengeluaranState>(
          builder: (context, state) {
            if (state.status == PengeluaranStatus.loading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == PengeluaranStatus.loaded ||
                state.status == PengeluaranStatus.error) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: ListView.builder(
                    itemCount: state.pengeluaran.length,
                    itemBuilder: (context, index) {
                      // int tanggal =
                      //     state.pengeluaran[index].tanggalPengeluaran.day;
                      // int tahun =
                      //     state.pengeluaran[index].tanggalPengeluaran.year;
                      // String bulan = DateFormat("MMMM").format(DateTime(0,
                      //     state.pengeluaran[index].tanggalPengeluaran.month));
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPengeluaranPage(
                                  id: state.pengeluaran[index].idPengeluaran),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.pink[100],
                              child: Center(
                                child: Text("${index + 1}"),
                              ),
                            ),
                            title: Text(
                              DateFormat.yMMMMEEEEd('id_ID').format(
                                  state.pengeluaran[index].tanggalPengeluaran),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {}),
    );
  }

  AppBar _appBar() => AppBar(title: const Text("List Transaksi"));
}
