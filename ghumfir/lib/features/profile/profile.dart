import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ghumfir/features/profile/docs_page.dart';
import 'package:ghumfir/features/profile/widgets/list_widet.dart';
import 'package:ghumfir/features/profile/widgets/prefered_sized.dart';
import 'package:ghumfir/res/strings.dart';
import 'package:ghumfir/themes/colors.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.blueSwatch.shade50,
      appBar: ResizedAppBar(
        child: AppBar(
          flexibleSpace: SafeArea(
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                const CircleAvatar(
                  radius: 21,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Text('JD'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sachin Basnet',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "sachinbasnet971@gmail.com",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: const Text("0 Points"),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "Profile",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.blueSwatch.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTileContainer(
                items: [
                  ListItem(
                      title: "Personal Details",
                      avatarText: imageStrings.personalDetail,
                      onTap: () {}),
                  ListItem(
                      title: "Customer Service",
                      avatarText: imageStrings.customerService,
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "History and offers",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.blueSwatch.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTileContainer(
                items: [
                  ListItem(
                      title: "Tour History",
                      avatarText: imageStrings.gameHistory,
                      onTap: () {}),
                  ListItem(
                      title: "Plans & Offers",
                      avatarText: imageStrings.store,
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // Text(
              //   "Payment",
              //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //         color: AppColors.blueSwatch.shade900,
              //         fontWeight: FontWeight.w500,
              //         fontSize: 18,
              //       ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // ListTileContainer(
              //   items: [
              //     ListItem(
              //         title: ProfileScreenStrings.loadWallet,
              //         avatarText: imageStrings.loadWallet,
              //         onTap: () {}),
              //     ListItem(
              //         title: ,
              //         avatarText: imageStrings.withDraw,
              //         onTap: () {}),
              //   ],
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              Text(
                "Help & Support",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.blueSwatch.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTileContainer(
                items: [
                  ListItem(
                      title: "About Us",
                      avatarText: imageStrings.loadWallet,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DocumentPage(
                                    title: "About Us",
                                    excerpt:
                                        "This is a beautiful place to visit. You can enjoy the view of the mountains and the river.")));
                      }),
                  ListItem(
                      title: "Terms & Conditions",
                      avatarText: imageStrings.withDraw,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DocumentPage(
                                    title: "Terms and Conditions",
                                    excerpt:
                                        "This is a beautiful place to visit. You can enjoy the view of the mountains and the river.")));
                      }),
                  ListItem(
                      title: "Privacy Policy",
                      avatarText: imageStrings.withDraw,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DocumentPage(
                                    title: "Privacy Policy",
                                    excerpt:
                                        "This is a beautiful place to visit. You can enjoy the view of the mountains and the river.")));
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Delete & Logout",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.blueSwatch.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListTileContainer(
                items: [
                  ListItem(
                      title: "Delete Account",
                      avatarText: imageStrings.deleteAccount,
                      onTap: () {}),
                  ListItem(
                      title: "Logout",
                      avatarText: imageStrings.logout,
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
