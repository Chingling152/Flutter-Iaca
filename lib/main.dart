import 'package:flutter/material.dart';
import 'package:iaca/screens/products/product/customProduct.dart';

void main() => runApp(IacaApp());

class IacaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Iaçá - Casa do açai",
      //theme: no,
      initialRoute: "/",
      routes: <String,WidgetBuilder>{
        "/":(BuildContext context)=> CustomProduct()
      }
    );
  }
}
