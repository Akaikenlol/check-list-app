import 'package:check_list_app/components/list_card.dart';
import 'package:check_list_app/components/recent_list_card.dart';
import 'package:check_list_app/utils/constant.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> listCount = [
    // [picture,name, shopName, price]
    {
      'imgURL':
          'https://i.pinimg.com/564x/ba/5b/68/ba5b689b0226afd422e2f14c6a4e7d09.jpg',
      'name': 'Keyboard',
      'shopName': 'TechnoLand',
      'price': '69.99'
    },
    {
      'imgURL':
          'https://i.pinimg.com/564x/62/fb/6c/62fb6c43ca711925d31c2b9242a4b883.jpg',
      'name': 'MousePad',
      'shopName': 'Technoland',
      'price': '42.9'
    },
    {
      'imgURL':
          'https://i.pinimg.com/564x/4c/c9/97/4cc997edb2e0a9ed581e1d5fbcd3aa18.jpg',
      'name': 'Cola',
      'shopName': 'G&G',
      'price': '1.9'
    },
    {
      'imgURL':
          'https://i.pinimg.com/564x/ad/d4/fa/add4fa9d9c4d5021bd2f9323d6470d8b.jpg',
      'name': 'Cloth',
      'shopName': 'B&B',
      'price': '59.9'
    }
  ];

  final _product = supabase.from('Product').select();

  @override
  Widget build(BuildContext context) {
    print(_product);
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Add List',
              style: TextStyle(
                color: Color.fromRGBO(51, 226, 170, 1),
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  hintText: "Search your product",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'For You',
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 170,
              child: FutureBuilder(
                future: _product,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final product = snapshot.data!;
                  List<Widget> firstFourProduct = [];
                  List<Widget> theRestOfTheProduct = [];
                  if (product.length > 4) {
                    for (int i = 0; i < 4; i++) {
                      firstFourProduct.add(
                        ShopCard(
                          imgURL:
                              'https://i.pinimg.com/736x/83/bf/5b/83bf5b1a398fd61853748b7aa48657ab.jpg',
                          shopName: product[i]['shop_name'],
                          price: product[i]['price'],
                          name: product[i]['name'],
                        ),
                      );
                    }
                    for (int i = 4; i < product.length; i++) {
                      theRestOfTheProduct.add(
                        RecentCard(
                          imgURL:
                              'https://i.pinimg.com/736x/83/bf/5b/83bf5b1a398fd61853748b7aa48657ab.jpg',
                          shopName: product[i]['shop_name'],
                          price: product[i]['price'],
                          name: product[i]['name'],
                        ),
                      );
                    }
                  }
                  return product.length < 1
                      ? Center(
                          child: Container(
                            child: Text(
                              "You Currently Don't Have Product",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: firstFourProduct,
                        );
                  //  ListView.builder(
                  //     itemCount: product.length,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return;
                  //     },
                  //   );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListView(
                    scrollDirection: Axis.vertical,
                    children: theRestOfTheProduct,
                  );
            ))
          ],
        ),
      ),
    );
  }
}
