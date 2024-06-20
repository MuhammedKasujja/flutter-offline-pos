import 'package:flutter/material.dart';
import 'package:offline_kalteck_pos/widgets/widgets.dart';

import '../../../pos/presentation/pages/pos.screen.dart';
import '../../../purchases/presentation/pages/purchases.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvancedAppTabs(
        tabs: const ['POS', 'Sales', 'Purchases', 'Invoices', 'Settings'],
        views: [
          const POSScreen(),
          Container(color: Colors.blue, child: const Text('Sales')),
          const PurchacesScreen(),
          Container(color: Colors.amber, child: const Text('Invoices')),
          Container(color: Colors.brown, child: const Text('Settings')),
        ],
      ),
    );
  }
}
