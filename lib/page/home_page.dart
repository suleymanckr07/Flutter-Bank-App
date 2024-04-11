import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/add_button.dart';
import '../utils/constant.dart';
import 'banka_page.dart';
import 'kredi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade200,
        title:  Text(
          Constant.appBarKartlarim,
          style: GoogleFonts.lato().copyWith(fontWeight: FontWeight.bold,color: Colors.black54)
        ),
        // App Bar Icon Button
        actions: const [AddButton()],
        // Tabbar
        bottom: TabBar(
          unselectedLabelColor: Colors.black38,
          overlayColor: null,
          indicatorColor: Colors.black54,
          labelColor: Colors.black,
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Banka Hesabı', // Assuming you want this as a fallback
            ),
            Tab(
              text:
                  'Kredi Karti Hesabı', // Assuming you want this as a fallback
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          BankaPage(),
          KrediPage(),
        ],
      ),
    );
  }
}
