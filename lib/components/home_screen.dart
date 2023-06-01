import 'package:check_list_app/components/styles.dart';
import 'package:check_list_app/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _product =
      Supabase.instance.client.from("Product").stream(primaryKey: ["id"]);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find your",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Check List",
                  style: TextStyle(
                    color: Color.fromRGBO(51, 226, 170, 1),
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'You have ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '3',
                    style: TextStyle(
                      color: Color.fromRGBO(51, 226, 170, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' items today',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: _product,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final product = snapshot.data!;

                  return ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: ProductCard(
                          product: product,
                          index: index,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.index});

  final List<Map<String, dynamic>> product;
  final int index;

  void _deleteProduct(BuildContext context, int id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Are you sure You want to delete this item?"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              await supabase
                                  .from("Product")
                                  .delete()
                                  .match({"id": id});
                              ;
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://i.pinimg.com/564x/ba/5b/68/ba5b689b0226afd422e2f14c6a4e7d09.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product[index]["name"],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        product[index]["shop_name"],
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$${product[index]["price"]}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   color: Colors.red,
              // ),
              height: double.infinity,
              child: IconButton(
                onPressed: () => _deleteProduct(context, product[index]["id"]),
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
              ))
        ],
      ),
    );
  }
}
