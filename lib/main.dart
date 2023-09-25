import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromARGB(255, 232, 232, 232),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const MainActivity(),
          binding: MainActivityBinding(),
        ),
      ],
    );
  }
}

class MainActivity extends GetView<MainActivityController> {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainActivityController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: IndexedStack(
            index: controller.index,
            children: const <Widget>[
              Text("Home"),
              Text("Search"),
              Text("Tickets"),
              Text("Profile"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          currentIndex: controller.index,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xff526480),
          onTap: controller.onNotifyIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Tickets",
            ),
            BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}

class MainActivityController extends GetxController {
  int index = 0;

  void onNotifyIndex(int index) {
    this.index = index;
    update();
  }
}

class MainActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainActivityController>(() => MainActivityController());
  }
}
