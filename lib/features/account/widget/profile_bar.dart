import 'package:cartopia/models/user.dart';
import 'package:flutter/material.dart';

class ProfileBar extends StatefulWidget {

  final User user;

  const ProfileBar({
    super.key,
    required this.user,
    });

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=2885&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        ),
        SizedBox(width: 20,),
        Text(
          '${widget.user.name}',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black
          ),
        )
      ],
    );
  }
}