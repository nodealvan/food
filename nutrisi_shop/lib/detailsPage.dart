import 'package:flutter/material.dart';
import 'package:nutrisi_shop/animation/rotasi.dart';
import 'package:nutrisi_shop/food_item.dart';

class DetailsPage extends StatefulWidget {
  final String heroTag;
  final String foodName;
  final String foodPrice;
  final String bahan;

  DetailsPage({
    required this.heroTag,
    required this.foodName,
    required this.foodPrice,
    required this.bahan,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 115.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                height: 200.0,
                width: 200.0,
                child: RotatingImage(
                  imgPath: widget.heroTag,
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodName,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          formatRupiah(double.parse(
                              widget.foodPrice.replaceAll('Rp ', ''))),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 25.0,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: const Color(0xFF7A9BEE),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: const Color(0xFF7A9BEE),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$quantity',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.grey,
                      width: 350,
                    ),
                    const SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.bahan,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              width: 2.0,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                 height: 50,
                                  width: 50,
                                  child: Image(
                                      image:
                                          AssetImage("assets/icon/hot.png"))),
                              Text('200 Kcal')
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              width: 2.0,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image:
                                          AssetImage("assets/icon/time.png"))),
                              Text('15-20 min')
                            ],
                          ),
                        ),
                        Container(
                            height: 150,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                                width: 2.0,
                              ),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/icon/deliver.png")),
                                ),
                                Text('10-30 min')
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Calories'),
                        Text('Cooking'),
                        Text('Deliver')
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                          color: Colors.black,
                        ),
                        height: 50.0,
                        child: Center(
                          child: Text(
                            formatRupiah(double.parse(
                                    widget.foodPrice.replaceAll('Rp ', '')) *
                                quantity),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void selectCard(String cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
