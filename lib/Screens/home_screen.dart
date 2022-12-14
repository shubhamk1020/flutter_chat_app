import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Pages/call_page.dart';
import 'package:flutter_chat_app/Pages/contact_page.dart';
import 'package:flutter_chat_app/Pages/message_page.dart';
import 'package:flutter_chat_app/Pages/notification_page.dart';
import 'package:flutter_chat_app/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (val) {
          pageIndex.value = val;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;

  const _BottomNavigationBar({super.key, required this.onItemSelected});

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavigationBarItem(
              index: 0,
              label: "Message",
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              isSelected: (selectedIndex == 0),
              onTap: handleItemSelected,
            ),
            _NavigationBarItem(
                index: 1,
                label: "Notification",
                icon: CupertinoIcons.bell_solid,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected),
            _NavigationBarItem(
                index: 2,
                label: "Calls",
                icon: CupertinoIcons.phone_fill,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected),
            _NavigationBarItem(
                index: 3,
                label: "Contacts",
                icon: CupertinoIcons.person_2_fill,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected),
          ],
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;
  final bool isSelected;

  const _NavigationBarItem(
      {super.key,
      required this.index,
      required this.label,
      required this.icon,
      required this.onTap,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isSelected ? 25 : 20,
              textDirection: isSelected ? TextDirection.rtl : TextDirection.ltr,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              label,
              style: TextStyle(
                  color: isSelected ? AppColors.secondary : null,
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : null),
            ),
          ],
        ),
      ),
    );
  }
}
