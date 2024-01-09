import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/detail_pengeluaran/detail_pengeluaran_bloc.dart';

class DetailPengeluaranPage extends StatelessWidget {
  final int id;
  const DetailPengeluaranPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocProvider(
        create: (context) =>
            DetailPengeluaranBloc()..add(GetDetailPengeluaranEvent(id: id)),
        child: BlocBuilder<DetailPengeluaranBloc, DetailPengeluaranState>(
          builder: (context, state) {
            if (state is DetailPengeluaranLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailPengeluaranLoaded) {
              return Column(children:[Text(state.detail.data.tanggalPengeluaran.toString()),
            ListView.builder(
            shrinkWrap: true,
            itemCount: state.detail.data.barangs.length,
            itemBuilder: (context, index) {
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[

            Text(state.detail.data.barangs[index].namaBarang),
            Text(state.detail.data.barangs[index].detailPengeluaran.kuantitas.toString()),
            Text(state.detail.data.barangs[index].hargaBarang.toString()),

            ],);
            // return Container(
            //     child: Text(state.detail.data.barangs[index].namaBarang));
            },
            )]);
            }
            if (state is DetailPengeluaranError) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Detail Pengeluaran"),
    );
  }
}
