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
        child: BlocListener<PengeluaranBloc, PengeluaranState>(
          listenWhen: (previous, current) {
            return current.isDeleting || previous.isDeleting;
          },
          listener: (context, state) {
            if (state.status == PengeluaranStatus.error) {
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Text(state.failureMessage),
                        actions: [
                          ElevatedButton(
                            child: const Text('Pop'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ]);
                  });
            }
          },
          child: BlocBuilder<PengeluaranBloc, PengeluaranState>(
            builder: (context, state) {
              if (state.status == PengeluaranStatus.loading &&
                  state.pengeluaran.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == PengeluaranStatus.error &&
                  state.pengeluaran.isEmpty) {
                return Center(child: Text(state.errorMessage));
              }

              return state.pengeluaran.isEmpty
                  ? const Center(child: Text("Tidak Ada Pengeluaran"))
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.pengeluaran.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPengeluaranPage(
                                                id: state.pengeluaran[index]
                                                    .idPengeluaran),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          context.read<PengeluaranBloc>().add(
                                                DeletePengeluaranEvent(
                                                    id: state.pengeluaran[index]
                                                        .idPengeluaran),
                                              );
                                        },
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.pink[100],
                                        child: Center(
                                          child: Text("${index + 1}"),
                                        ),
                                      ),
                                      title: Text(
                                        DateFormat.yMMMMEEEEd('id_ID').format(
                                            state.pengeluaran[index]
                                                .tanggalPengeluaran),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          FloatingActionButton(
                              child: state.isDeleting
                                  ? const CircularProgressIndicator()
                                  : Container(),
                              onPressed: () {}),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(title: const Text("List Transaksi"));
  }
}
