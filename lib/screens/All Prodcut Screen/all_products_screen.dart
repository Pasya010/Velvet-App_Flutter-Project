import 'package:flutter/material.dart';
import 'package:velvet_app/list/categories_list.dart';
import 'package:velvet_app/screens/All%20Prodcut%20Screen/popular_product_screen.dart';
import 'package:velvet_app/screens/notification_screen.dart';
import 'package:velvet_app/screens/profile_screen.dart';
import 'package:velvet_app/screens/transaction_screen.dart';
import 'package:velvet_app/widgets/categories_widget.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarBuilder(),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            // Tab bar
            TabBar(
              labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 600
                    ? 18
                    : 14, // Responsive font size
              ),
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Latest'),
                Tab(text: 'Best Seller'),
                Tab(text: 'Price'),
              ],
            ),

            // Product Category
            SizedBox(
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 30),
                      child: CategoriesWidget(
                          icon: category['icon'], text: category['text']),
                    );
                  }),
            ),

            // Tab Bar Content
            Expanded(
              child: TabBarView(
                children: [
                  PopularProductScreen(),
                  TransactionScreen(),
                  NotificationScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBarBuilder() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: TextField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.width > 600
                ? 18
                : 14, // Responsive hint text
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
      ],
    );
  }
}
