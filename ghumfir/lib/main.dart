import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghumfir/features/egallery/e_gallery.dart';
import 'package:ghumfir/features/home/presentation/home.dart';
import 'package:ghumfir/features/maps/map_view.dart';
import 'package:ghumfir/features/profile/profile.dart';
import 'package:ghumfir/res/strings.dart';
import 'package:ghumfir/themes/colors.dart';
import 'package:ghumfir/themes/my_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghumfir',
      theme: AppTheme.lightTheme,
      home: const MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarIndex = ref.watch(navbarIndexProvider);
    const List<Widget> _pages = <Widget>[
      HomePage(),
      MyMapPage(title: ""),
      EGallery(),
      AccountScreen(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: navbarIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: navbarIndex,
          onTap: (int index) {
            ref.read(navbarIndexProvider.notifier).state = index;
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(imageStrings.home,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 0 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(imageStrings.map,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 1 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'map'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(imageStrings.gallery,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 2 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'eGallery'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(imageStrings.account,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 3 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'Profile'),
          ]),
    );
  }
}

final navbarIndexProvider = StateProvider<int>((ref) {
  return 0;
});
