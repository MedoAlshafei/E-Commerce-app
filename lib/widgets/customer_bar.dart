import 'package:flutter/material.dart';

class CustomerBar extends StatelessWidget {
  const CustomerBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    // final width = size.width;
    // final height = size.height;

    return SizedBox(
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_welcomeCustomer(), profileImage()],
      ),
    );
  }

  Widget profileImage() {
    const String profileImage = 'assets/boy.png';
    return CircleAvatar(
      child: Image.asset(
        profileImage,
        // fit: BoxFit.fill,
        // height: 32,
        // color: Colors.black,
        // scale: 32,
      ),
    );
  }

  Widget _welcomeCustomer() {
    const String helloWelcome = 'Hello, Welcome 👋';
    const String userName = 'Albert Stevano';

    return const Column(
      children: [
        Text(
          helloWelcome,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        Text(
          userName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
