import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OffersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OffersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
