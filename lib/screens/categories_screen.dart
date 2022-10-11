import 'package:flutter/material.dart';
import 'package:ifystore_app_withapi/models/category_model.dart';
import 'package:ifystore_app_withapi/services/apiservices.dart';
import 'package:ifystore_app_withapi/widgets/category_widget.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: FutureBuilder<List<CategoriesModel>>(
            future: ApiServices.getAllCategories(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                Center(
                  child: Text("An error occure ${snapshot.error}"),
                );
              } else if (snapshot.hasData == null) {
                Center(
                  child: Text("No product has been added"),
                );
              }
              return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 1.2),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index], child: CategoryWidget());
                  });
            })));
  }
}
