import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('FastMov',
          style: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF6868AC)
          ),
        ),
        actions: [
          IconButton(
            icon: const HeroIcon(HeroIcons.bell),
            onPressed: () {},
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
            radius: 18,
          ),
        ),
      )
    );
  }
}