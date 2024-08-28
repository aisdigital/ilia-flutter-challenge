import 'package:flutter/material.dart';

class MovieBannerWidget extends StatelessWidget {
  const MovieBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.amber,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 69, 34, 139),
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
