import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostCatagoryCard extends StatelessWidget {
  const PostCatagoryCard(
      {super.key,
      required this.buttonColor,
      required this.catagoryIcon,
      required this.catagoryName});

  final String catagoryName;
  final IconData catagoryIcon;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: IconButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor)),
              icon: Icon(
                catagoryIcon,
                size: 14,
              ),
            ),
          ),
          const Gap(10),
          Text(
            catagoryName,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
