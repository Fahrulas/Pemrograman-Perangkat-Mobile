import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPM Sesi 2',
      // Pilihan warna tema aplikasi (bisa diubah sesuai keinginan)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // SESUAIKAN DENGAN NAMA DAN NIM KAMU
        title: const Text(
          'PPM Sesi 2 - M. Fahrul Albiansyah S (20240040235)',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            // Banner Promo menggunakan Stack & Positioned
            PromoBannerWidget(),
            SizedBox(height: 16),

            // Kartu Profil Mahasiswa (StatelessWidget)
            ProfileCardWidget(
              nama: 'M.Fahrul Albiansyah S', // Sesuaikan
              nim: '20240040235', // Sesuaikan
              prodiKelas: 'Teknik Informatika / TI-24G', // Sesuaikan
            ),
            SizedBox(height: 16),

            // Kartu Produk (StatefulWidget)
            ProductCardWidget(
              namaProduk: 'Headphone Wireless Noise Cancelling',
              kategori: 'Elektronik & Aksesoris',
              hargaAwal: 350000,
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. BANNER PROMO (Stack & Positioned)
// ==========================================
class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.indigo.shade800, Colors.indigo.shade400],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          // Background Decorator Icon (Hiasan di latar belakang)
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.local_offer,
              size: 140,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          // Teks Promo Utama
          Positioned(
            left: 20,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PROMO HARBOLNAS! 🎉',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Diskon hingga 50% untuk semua aksesoris!',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          // Badge Label Diskon di sudut kanan atas
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'HOT SALE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. KARTU PROFIL MAHASISWA (StatelessWidget)
// ==========================================
class ProfileCardWidget extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodiKelas;

  const ProfileCardWidget({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodiKelas,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Foto / Ikon Profil
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.indigo.shade100,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(width: 16),
            // Detail Profil Mahasiswa
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NIM: $nim',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    'Prodi/Kelas: $prodiKelas',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  // 5 Ikon Bintang
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
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

// ==========================================
// 3. KARTU PRODUK (StatefulWidget)
// ==========================================
class ProductCardWidget extends StatefulWidget {
  final String namaProduk;
  final String kategori;
  final int hargaAwal;

  const ProductCardWidget({
    super.key,
    required this.namaProduk,
    required this.kategori,
    required this.hargaAwal,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isFavorite = false;
  int likeCount = 12;
  int quantity = 1;

  // Fungsi toggle Favorite / Like
  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  }

  // Fungsi tambah kuantitas
  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Fungsi kurangi kuantitas (Minimal 1)
  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga = widget.hargaAwal * quantity;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder Gambar Produk
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.headphones,
                  size: 100,
                  color: Colors.indigo.shade300,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Kategori Produk
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                widget.kategori,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Nama Produk & Tombol Like/Favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.namaProduk,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                    Text('$likeCount'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Harga Satuan & Total Harga
            Text(
              'Harga Satuan: Rp ${widget.hargaAwal}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              'Total: Rp $totalHarga',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),

            // Pengatur Jumlah (Quantity) & Tombol Tambah Keranjang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol - dan +
                Row(
                  children: [
                    IconButton(
                      onPressed: _decrementQuantity,
                      icon: const Icon(Icons.remove_circle_outline),
                      color: quantity > 1 ? Colors.indigo : Colors.grey,
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: _incrementQuantity,
                      icon: const Icon(Icons.add_circle_outline),
                      color: Colors.indigo,
                    ),
                  ],
                ),

                // Tombol Tambah ke Keranjang
                ElevatedButton.icon(
                  onPressed: () {
                    // Menampilkan SnackBar saat ditekan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$quantity x ${widget.namaProduk} telah ditambahkan ke keranjang!',
                        ),
                        backgroundColor: Colors.indigo,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text(
                    'Tambah',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}