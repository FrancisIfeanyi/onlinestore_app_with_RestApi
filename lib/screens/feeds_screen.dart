import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ifystore_app_withapi/models/product_model.dart';
import 'package:ifystore_app_withapi/services/apiservices.dart';
import 'package:ifystore_app_withapi/widgets/appbar_icons.dart';
import 'package:ifystore_app_withapi/widgets/feeds_widget.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ProductsModel> productList = [];

  @override
  void didChangeDependencies() {
    getProduct();
    super.didChangeDependencies();
  }

  Future<void> getProduct() async {
    productList = await ApiServices.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Products'),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyBold.category,
          ),
        ),
        body: productList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.7),
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                      value: productList[index], child: FeedsWidget());
                }));
  }
}
