import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ifystore_app_withapi/consts/global_colors.dart';
import 'package:ifystore_app_withapi/models/product_model.dart';
import 'package:ifystore_app_withapi/screens/categories_screen.dart';
import 'package:ifystore_app_withapi/screens/feeds_screen.dart';
import 'package:ifystore_app_withapi/screens/user_screen.dart';
import 'package:ifystore_app_withapi/services/apiservices.dart';
import 'package:ifystore_app_withapi/widgets/appbar_icons.dart';
import 'package:ifystore_app_withapi/widgets/feeds_grid_widget.dart';
import 'package:ifystore_app_withapi/widgets/feeds_widget.dart';
import 'package:ifystore_app_withapi/widgets/sale_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  // List<ProductsModel> productList = [];

  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProduct();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProduct() async {
  //   productList = await ApiServices.getAllProducts();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: CategoriesScreen()));
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: UserScreen()));
                },
                icon: IconlyBold.user3)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    )),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return SalesWidget();
                          },
                          pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                activeColor: Colors.red,
                                color: Colors.white,
                              )),
                          // control: SwiperControl(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Latest Products',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FeedScreen()));
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ProductsModel>>(
                          future: ApiServices.getAllProducts(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child:
                                    Text("An error occure ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              return Center(
                                child: Text("No product has been added"),
                              );
                            }
                            return FeedsGridWidget(
                              productList: snapshot.data!,
                            );
                          }))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
