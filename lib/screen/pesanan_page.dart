import 'package:flutter/material.dart';
import 'package:latihan_kuis/data/menu_data.dart';

class PesananFood extends StatefulWidget {
  final int index;
  const PesananFood({super.key, required this.index});

  @override
  State<PesananFood> createState() => _PesananFoodState();
}

class _PesananFoodState extends State<PesananFood> {
  final TextEditingController _jumlahController = TextEditingController();
  int totalHarga = 0;
  // State variable to control visibility
  bool _isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _jumlahController.addListener(_hitungTotalHarga);
  }

  @override
  void dispose() {
    _jumlahController.dispose();
    super.dispose();
  }

  void _hitungTotalHarga() {
    final int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    String cleanedPriceString = foodList[widget.index].price
        .replaceAll('Rp ', '')
        .replaceAll('.', '');

    // Konversi string yang sudah bersih menjadi integer
    final int hargaSatuan = int.parse(cleanedPriceString);
    setState(() {
      totalHarga = jumlah * hargaSatuan;
      // Reset visibility when the text changes
      _isSubmitted = false;
    });
  }

  void _submitOrder() {
    setState(() {
      _isSubmitted = true;
    });
    // Show a snackbar or other feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pesanan berhasil! Total: Rp $totalHarga')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Order",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(241, 255, 229, 82),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(foodList[widget.index].imageUrl),
              const SizedBox(height: 16),
              Text(
                foodList[widget.index].name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Harga: ${foodList[widget.index].price}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _jumlahController,
                decoration: const InputDecoration(
                  labelText: "Masukkan jumlah order",
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(241, 255, 229, 82),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(241, 255, 229, 82),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(241, 255, 229, 82),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: _submitOrder,
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(height: 24),
              if (_isSubmitted)
                Text(
                  "Total Harga: Rp $totalHarga",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
