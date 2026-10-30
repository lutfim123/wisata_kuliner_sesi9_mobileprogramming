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
      title: 'Wisata Indonesia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D6EFD)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) => const MenuPage(
              menuTitle: 'Pantai',
              itemTitle: 'Pantai Kuta',
              description:
                  'Pantai indah di Bali dengan hamparan pasir putih yang lembut serta pemandangan matahari terbenam yang memukau.',
              icon: Icons.beach_access,
              themeColor: Color(0xFF0288D1),
              showDetailButton: true,
            ),
        '/gunung': (context) => const MenuPage(
              menuTitle: 'Gunung',
              itemTitle: 'Gunung Bromo',
              description:
                  'Gunung berapi aktif di Jawa Timur yang terkenal dengan kawah megah, kaldera luas, dan hamparan lautan pasir.',
              icon: Icons.terrain,
              themeColor: Color(0xFF2E7D32),
            ),
        '/budaya': (context) => const MenuPage(
              menuTitle: 'Budaya',
              itemTitle: 'Tari Kecak',
              description:
                  'Seni pertunjukan tari tradisional khas Bali yang dimainkan secara melingkar dengan irama suara kompak dan penuh makna.',
              icon: Icons.museum,
              themeColor: Color(0xFFEF6C00),
            ),
        '/kuliner': (context) => const MenuPage(
              menuTitle: 'Kuliner',
              itemTitle: 'Rendang Padang',
              description:
                  'Makanan khas Sumatera Barat berbahan dasar daging sapi pilihan yang dimasak dengan santan dan rempah-rempah Nusantara.',
              icon: Icons.restaurant,
              themeColor: Color(0xFFC62828),
            ),
        '/detail': (context) => const DetailWisataPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String routeName,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shadowColor: color.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 36,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Wisata Indonesia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D6EFD),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildMenuCard(
            context: context,
            title: 'Pantai',
            icon: Icons.beach_access,
            routeName: '/pantai',
            color: const Color(0xFF0288D1),
          ),
          _buildMenuCard(
            context: context,
            title: 'Gunung',
            icon: Icons.terrain,
            routeName: '/gunung',
            color: const Color(0xFF2E7D32),
          ),
          _buildMenuCard(
            context: context,
            title: 'Budaya',
            icon: Icons.museum,
            routeName: '/budaya',
            color: const Color(0xFFEF6C00),
          ),
          _buildMenuCard(
            context: context,
            title: 'Kuliner',
            icon: Icons.restaurant,
            routeName: '/kuliner',
            color: const Color(0xFFC62828),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final String itemTitle;
  final String description;
  final IconData icon;
  final Color themeColor;
  final bool showDetailButton;

  const MenuPage({
    super.key,
    required this.menuTitle,
    required this.itemTitle,
    required this.description,
    required this.icon,
    required this.themeColor,
    this.showDetailButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(
          menuTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: themeColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 64,
                      color: themeColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: themeColor, size: 22),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          itemTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (showDetailButton) ...[
                        Flexible(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: itemTitle,
                              );
                            },
                            icon: const Icon(Icons.info_outline, size: 18),
                            label: const Text(
                              'Lihat Detail',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                      Flexible(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: showDetailButton
                                ? Colors.grey.shade200
                                : themeColor,
                            foregroundColor:
                                showDetailButton ? Colors.black87 : Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back, size: 18),
                          label: const Text(
                            'Kembali',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailWisataPage extends StatelessWidget {
  const DetailWisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String namaTempatWisata =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Pantai Kuta';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Detail Wisata',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0288D1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0288D1).withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.place,
                      size: 60,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Nama Tempat Wisata:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.beach_access,
                        color: Color(0xFF0288D1),
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          namaTempatWisata,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0288D1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0288D1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
