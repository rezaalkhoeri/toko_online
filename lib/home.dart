import 'package:flutter/material.dart';
import 'package:toko_online/cart.dart';
import 'package:toko_online/Utils/Custom_Utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
                onTap: () {},
                style: TextStyle(fontSize: 15),
                decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    hintText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                        color: Color.fromARGB(255, 73, 176, 255),
                      ),
                    ))),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                },
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 73, 176, 255),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Semua', icon: Icon(Icons.now_widgets)),
                Tab(text: 'Kategori', icon: Icon(Icons.menu_open_sharp)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Builder(
                  builder: (context) {
                    return Container(
                      color: Colors.grey.shade100,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.68),
                        itemBuilder: (context, position) {
                          return gridItem(context, position);
                        },
                        itemCount: 20,
                      ),
                      margin:
                          EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
                    );
                  },
                ),
              ),
              Center(child: Text('Kategori')),
            ],
          ),
        ),
      ),
    );
  }

  gridItem(BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        // filterBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: Colors.grey.shade200)),
        padding: EdgeInsets.only(left: 10, top: 10),
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 12),
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                width: 24,
                height: 24,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
                child: Text(
                  "30%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10),
                ),
              ),
            ),
            Image(
              image: AssetImage("assets/logo.png"),
              height: 170,
              fit: BoxFit.cover,
            ),
            gridBottomView()
          ],
        ),
      ),
    );
  }

  gridBottomView() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Chair Dacey li - Black",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.start,
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: 10),
          ),
          Utils.getSizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "\$50.00",
                style: TextStyle(color: Colors.indigo.shade700, fontSize: 14),
              ),
              Utils.getSizedBox(width: 8),
              Text(
                "\$80.00",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          Utils.getSizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar.builder(
                initialRating: 4,
                itemSize: 14,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                allowHalfRating: true,
                onRatingUpdate: (rating) {},
              ),
              Utils.getSizedBox(width: 4),
              Text(
                "4.5",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }

  createSlider(String image) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}
