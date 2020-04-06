import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/misc/text_size.dart';
import 'package:covidelivery/pages/grocery/grocery_page.dart';
import 'package:covidelivery/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          // horizontal: 32.0,
          vertical: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            text: 'Ciao ',
                            children: [
                              TextSpan(
                                text: 'Alessandra',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(text: ', ti trovi a'),
                            ],
                          ),
                        ),
                        Text(
                          'Martinengo',
                          style: TextStyle(
                            fontSize: TextSize.extra,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.fromSize(
                    size: Size.fromRadius(24.0),
                    child: Material(
                      elevation: 6.0,
                      color: Palette.primary,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'res/donna.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '1 corriere disponibile su 3',
                    style: TextStyle(
                      fontSize: TextSize.text,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    height: 80.0,
                    child: ListView(
                      padding: EdgeInsets.only(right: 16.0),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CorriereTile(
                          name: 'Simone',
                          stars: '4,6',
                          imgUrl: 'simone.jpeg',
                          price: '5',
                        ),
                        CorriereTile(
                          name: 'Leonardo',
                          stars: '4,9',
                          imgUrl: 'pizio.jpeg',
                        ),
                        CorriereTile(
                          name: 'Adrian',
                          stars: '4,3',
                          imgUrl: 'simone.jpeg',
                          price: '5',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Servizi',
                      style: TextStyle(
                        fontSize: TextSize.h1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ServiceTile(
                        img: 'res/spesa.png',
                        imgRadius: 54.0,
                        imgPadding: EdgeInsets.only(right: 4.0),
                        title: 'Ho bisogno di qualcuno che mi faccia la spesa',
                      ),
                      ServiceTile(
                        img: 'res/medicina_2.png',
                        imgPadding: EdgeInsets.only(bottom: 6.0, right: 4.0),
                        title:
                            'Ho bisogno di qualcuno che mi prenda le medicine',
                      ),
                      ServiceTile(
                        img: 'res/jacky.png',
                        imgRadius: 42.0,
                        imgPadding: EdgeInsets.only(bottom: 6.0, right: 8.0),
                        title:
                            'Ho bisogno di qualcuno che mi porti a spasso gli animali',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String img;
  final String title;
  final double imgRadius;
  final EdgeInsets imgPadding;
  final Function() onTap;

  const ServiceTile({
    Key key,
    @required this.title,
    @required this.img,
    this.imgRadius: 48.0,
    this.imgPadding: const EdgeInsets.all(0.0),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          clipBehavior: Clip.antiAlias,
          color: Palette.secondary,
          child: InkWell(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => GroceryPage())),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: TextSize.h2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Palette.primary,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: imgPadding,
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(imgRadius),
                      child: Image.asset(
                        img,
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CorriereTile extends StatelessWidget {
  final String name;
  final String price;
  final String stars;
  final String imgUrl;

  const CorriereTile({
    Key key,
    @required this.name,
    @required this.stars,
    @required this.imgUrl,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Material(
        color: Palette.secondary,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ProfilePage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromRadius(24.0),
                  child: Material(
                    color: Palette.primary,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'res/$imgUrl',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: TextSize.h2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(4.0),
                      color: (price != null ? Palette.accent : Palette.primary)
                          .withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 2.0,
                        ),
                        child: Text(
                          price != null ? '€ $price A CONSEGNA' : 'GRATUITO',
                          style: TextStyle(
                            fontSize: 8.0,
                            color: price != null
                                ? Palette.accent
                                : Palette.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 16.0,
                          color: Palette.star,
                        ),
                        Text(
                          stars,
                          style: TextStyle(
                            color: Palette.star,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
