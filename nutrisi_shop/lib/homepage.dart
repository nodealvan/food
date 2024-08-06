import 'package:flutter/material.dart';
import 'package:nutrisi_shop/detailsPage.dart';
import 'package:nutrisi_shop/food_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, CartItem> cart = {};
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void _showCart() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        double totalPrice = 0.0;
        List<Widget> cartItems = cart.entries.map((entry) {
          CartItem item = entry.value;
          totalPrice += item.price * item.quantity;
          return ListTile(
            leading: Image.asset(item.imgPath,
                height: 50, width: 50, fit: BoxFit.cover),
            title: Text(entry.key),
            subtitle: Text('Jumlah: ${item.quantity}'),
            trailing: Text(formatRupiah(item.price * item.quantity)),
          );
        }).toList();
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: cartItems,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Total: ${formatRupiah(totalPrice)}',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7A9BEE),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20.0)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('Delicious',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0)),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search food',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: _showCart,
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child:
                              Icon(Icons.shopping_basket, color: Colors.white),
                        ),
                      ),
                    ),
                    if (cart.isNotEmpty)
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            cart.values
                                .fold<int>(
                                    0, (sum, item) => sum + item.quantity)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: 400,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: foodItems
                        .where((item) => item['foodName']!
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .map((item) => _buildFoodItem(
                            item['imgPath']!,
                            item['foodName']!,
                            double.parse(item['price']!
                                .replaceAll('Rp', '')
                                .replaceAll(',', '')
                                .trim()),
                            item['bahan']!))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(
      String imgPath, String foodName, double price, String bahan) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(
              heroTag: imgPath,
              foodName: foodName,
              foodPrice: formatRupiah(price),
              bahan: bahan,
            ),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: [
              Hero(
                tag: imgPath,
                child: Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodName,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(formatRupiah(price),
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 85, 83, 83)))
                ],
              )
            ]),
            Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 22,
                    onPressed: () {
                      setState(() {
                        if (cart.containsKey(foodName)) {
                          cart[foodName]!.quantity += 1;
                        } else {
                          cart[foodName] = CartItem(
                            imgPath: imgPath,
                            price: price,
                            quantity: 1,
                          );
                        }
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String imgPath;
  final double price;
  int quantity;

  CartItem(
      {required this.imgPath, required this.price, required this.quantity});
}
