import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => new _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Crew(),
    );
  }
}

class Crew extends StatelessWidget {
  final List anggota = [
    "MUHAMAD ALDYAN - 19200019",
    "DEVI LESTARI - 19200038",
    "MUHAMMAD GANGSAR PRADISTYA - 19200065",
    "REZA AJI - 19200107",
    "DEWI ROSMAYANTI - 19200108"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("*Anggota Kelompok*"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(anggota[index], style: TextStyle(fontSize: 30)),
              leading: CircleAvatar(
                  child: Text(anggota[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 20))),
            ),
          );
        },
        itemCount: anggota.length,
      ),
    );
  }
}
