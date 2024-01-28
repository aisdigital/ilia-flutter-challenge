import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/infra/services/tools/ilia_layout.dart';

class IliaDrawerTile extends StatelessWidget {
  const IliaDrawerTile({
    super.key,
    required this.ontap,
    required this.title,
  });

  final Function() ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final layout = IliaLayout(context);

    final tileColor = Theme.of(context).colorScheme.primaryContainer;
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
              height: layout.height * .09,
              alignment: Alignment.center,
              color: tileColor,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
