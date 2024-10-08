import 'package:mobileii/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:mobileii/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:mobileii/DesignSystem/shared/styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  // ignore: library_private_types_in_public_ap
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int currentIndex = 3;

  final List<String> settingsOptions = [
    'Edit Name',
    'Shipping Info',
    'Notification',
    'Terms & Condition',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Title(
                  color: Colors.black,
                  child: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/AvatarProfile.png',
                    width: 64,
                    height: 64,
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amanda Doe',
                          style: button1Bold,
                        ),
                        Text(
                          'amanda@gmail.com',
                          style: paragraph1Regular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...settingsOptions.map((option) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option, style: paragraph1Regular),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ],
                  )),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Logut", style: TextStyle(color: Colors.red)),
                ),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.square),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        currentIndex: currentIndex,
      ),
    );
  }
}
