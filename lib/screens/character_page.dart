import 'package:flutter/material.dart';
import 'package:villain_x_hero/widgets/scorecard.dart';

class CharacterPage extends StatelessWidget {
  final dynamic data;
  CharacterPage({required this.data});
  String trimString(String s) {
    print(s);
    int index1 = s.indexOf(',');
    int index2 = s.indexOf(';');
    late int index;
    if (index1 >= 0 && index2 >= 0) {
      index = index1 < index2 ? index1 : index2;
    } else if (index1 >= 0) {
      index = index1;
    } else if (index2 >= 0) {
      index = index2;
    } else {
      index = s.length;
    }
    return s.substring(0, index);
  }

  String checkString(String s) {
    if (s == '-') return 'NO DATA';
    return s;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double smallTextSize = mediaQueryData.size.height * 0.02;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wood.jpeg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: mediaQueryData.size.height * 0.05,
            ),
            Text(
              data['name'],
              style: TextStyle(
                  color: Colors.white, fontSize: 55, fontFamily: 'Akronim'),
            ),
            Hero(
              tag: 'HeroImage${data['id']}',
              child: Image(
                image: NetworkImage(data['image']['url']),
                height: mediaQueryData.size.height * 0.4,
                width: mediaQueryData.size.width * 0.6,
              ),
            ),
            Text(
              'Name: ${checkString(data['biography']['aliases'][0])}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: smallTextSize,
                  fontFamily: 'Barlow'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Race: ${checkString(data['appearance']['race'])}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: smallTextSize,
                  fontFamily: 'Barlow'),
              textAlign: TextAlign.center,
            ),
            Text(
              'From: ${checkString(data['biography']['place-of-birth'])}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: smallTextSize,
                  fontFamily: 'Barlow'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Occupation: ${checkString(trimString(data['work']['occupation'].toString()))}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: smallTextSize,
                  fontFamily: 'Barlow'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Affiliation: ${checkString(trimString(data['connections']['group-affiliation'].toString()))}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: smallTextSize,
                  fontFamily: 'Barlow'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: mediaQueryData.size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Scorecard(
                  title: 'Intelligence',
                  value: data['powerstats']['intelligence'],
                ),
                Scorecard(
                  title: 'Strength',
                  value: data['powerstats']['strength'],
                ),
                Scorecard(
                  title: 'Speed',
                  value: data['powerstats']['speed'],
                ),
              ],
            ),
            SizedBox(
              height: mediaQueryData.size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Scorecard(
                  title: 'Combat',
                  value: data['powerstats']['combat'],
                ),
                Scorecard(
                  title: 'Durability',
                  value: data['powerstats']['durability'],
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
        constraints: BoxConstraints(
            minWidth: double.infinity, minHeight: double.infinity),
      ),
    );
  }
}
