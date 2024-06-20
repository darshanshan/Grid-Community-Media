import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 35,
            width: 35,
            color: Colors.black,
            child: Image.network(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Darshan',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '20 hrs ago',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        )
      ],
    );
  }
}
