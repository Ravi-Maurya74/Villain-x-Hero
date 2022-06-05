import 'package:flutter/material.dart';
import 'package:villain_x_hero/widgets/image2.dart';

class TempPage extends StatelessWidget {
  final dynamic data;
  TempPage({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Villain x Hero',
          style: TextStyle(
            color: Colors.red,
            fontFamily: 'Kaushan',
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            print(data);
            return ImageWidget(
                index: int.parse(data['results'][index]['id'].toString()));
          },
          itemCount: (data['results'] as List<dynamic>).length,
        ),
      ),
    );
  }
}
