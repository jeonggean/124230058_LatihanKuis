import 'package:flutter/material.dart';
import 'package:latihan_kuis/auth/login_page.dart';
import 'package:latihan_kuis/data/menu_data.dart';
import 'package:latihan_kuis/screen/pesanan_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(241, 255, 229, 82),
        toolbarHeight: 60,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo $username,',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 4), // Memberikan jarak antar teks
            const Text(
              'Mau Makan Apa Hari Ini?',
              style: TextStyle(
                fontSize: 11,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_outlined, color: Colors.white),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150, // Atur tinggi banner sesuai kebutuhan
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text("Daftar Menu"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return _foodStore(context, index);
                },
                //menghitung ada berapa item di gamelist nya
                itemCount: foodList.length, //
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodStore(context, int index) {
    //inkwell supaya gridnya linkable
    return InkWell(
      onTap: () {},
      child: Container(
        width: 250,
        height: 450,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(241, 255, 229, 82),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(
                240,
                174,
                169,
                138,
              ), // Warna bayangan transparan
              spreadRadius: 1, // Seberapa luas bayangan menyebar
              blurRadius: 5, // Seberapa buram bayangan
              offset: const Offset(0, 3), // Posisi bayangan (x, y)
            ),
          ],
        ),

        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                foodList[index].imageUrl,
                fit: BoxFit.cover, // Mengisi ruang yang tersedia tanpa distorsi
                height: 120, // Atur tinggi gambar agar konsisten
              ),
            ),
            // Tambahkan padding untuk konten di bawah gambar
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Untuk memusatkan konten secara horizontal
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    foodList[index].name,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 1, // Agar nama tidak melebihi satu baris
                    overflow: TextOverflow
                        .ellipsis, // Tambahkan ... jika terlalu panjang
                  ),
                  Text(
                    "Harga : ${foodList[index].price}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity, // Tombol mengisi seluruh lebar
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: const Color.fromARGB(
                      //     241,
                      //     255,
                      //     229,
                      //     82,
                      //   ),
                      // ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PesananFood(index: index);
                            },
                          ),
                        );
                      },

                      child: const Text("Order"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
