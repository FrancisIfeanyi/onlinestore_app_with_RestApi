import 'package:flutter/material.dart';
import 'package:ifystore_app_withapi/models/product_model.dart';
import 'package:ifystore_app_withapi/widgets/feeds_widget.dart';
import 'package:provider/provider.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productList})
      : super(key: key);

  final List<ProductsModel> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.7),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
              value: productList[index], child: FeedsWidget());
        });
  }
}
