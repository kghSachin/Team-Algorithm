import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghumfir/features/home/presentation/home.dart';
import 'package:ghumfir/res/strings.dart';
import 'package:ghumfir/themes/colors.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
      HomePage(),
      HomePage(),
    ];
    return Scaffold(
      body: const IndexedStack(
        index: 0,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {
            ref.read(navbarIndexProvider.notifier).state = index;
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppStrings.home,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 0 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppStrings.gallery,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 1 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppStrings.account,
                    colorFilter: ColorFilter.mode(
                        navbarIndex == 2 ? AppColors.blue : Colors.grey,
                        BlendMode.srcIn)),
                label: 'Profile'),
          ]),
    );
  }
}

final navbarIndexProvider = StateProvider<int>((ref) {
  return 0;
});
