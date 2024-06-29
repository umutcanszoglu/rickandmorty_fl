import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_fl/controllers/navbar_controller.dart';

class NavbarScreenPage extends StatelessWidget {
  const NavbarScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavbarController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Image.asset("assets/logo.png", width: 100),
        leading: Obx(
          () => controller.currentPage.value == 0
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              : const SizedBox(),
        ),
      ),
      body: Obx(() => controller.pages[controller.currentPage.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: controller.currentPage.value,
          onDestinationSelected: (index) {
            controller.currentPage.value = index;
          },
          destinations: const [
            NavigationDestination(
              tooltip: '',
              icon: Icon(Icons.menu_rounded),
              label: 'Characters',
              selectedIcon: Icon(Icons.menu_open_rounded),
            ),
            NavigationDestination(
              tooltip: '',
              icon: Icon(Icons.movie_creation_outlined),
              label: 'Episodes',
              selectedIcon: Icon(Icons.movie_creation_rounded),
            ),
            NavigationDestination(
              tooltip: '',
              icon: Icon(Icons.location_on_outlined),
              label: 'Locations',
              selectedIcon: Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}
