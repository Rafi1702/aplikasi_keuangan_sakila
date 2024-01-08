import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';

class ListBarangPage extends StatefulWidget {
  const ListBarangPage({super.key});

  @override
  State<ListBarangPage> createState() => _ListBarangPageState();
}

class _ListBarangPageState extends State<ListBarangPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<BarangBloc, BarangState>(
      builder: (context, state) {
        if (state.status == BarangStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == BarangStatus.loaded) {
          return state.barang.isEmpty
              ? const Center(
                  child: Text('Barang Kosong'),
                )
              : GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 24.0, // spacing between rows
                    crossAxisSpacing: 30.0, // spacing between columns
                    mainAxisExtent: 172.0, // height of container
                  ),
                  itemCount: state.barang.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                "https://ik.imagekit.io/mrggsfxta/default-image.jpg?updatedAt=1681846968829",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(state.barang[index].namaBarang),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text("Rp. ${state.barang[index].hargaBarang}"),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text("Stok: ${state.barang[index].stokBarang}")
                        ],
                      ),
                    );
                  },
                );
        }
        if (state.status == BarangStatus.error) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
