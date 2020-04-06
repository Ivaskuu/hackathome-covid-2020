import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/misc/text_size.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: CloseButton(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 32.0,
          // vertical: 64.0,
        ),
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.fromRadius(72.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Material(
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Palette.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'res/pizio.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.black54,
                    borderRadius: BorderRadius.circular(8.0),
                    clipBehavior: Clip.antiAlias,
                    color: Palette.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(4.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 2.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.healing,
                                size: 14.0,
                                color: Palette.primary,
                              ),
                              SizedBox(width: 6.0),
                              Text(
                                'GUARITO',
                                style: TextStyle(
                                  color: Palette.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 4.0,
                        backgroundColor: Palette.accent,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        'OCCUPATO',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Palette.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(),
                  Text(
                    '5€ A CONSEGNA',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Palette.accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                'Pizio Leonardo',
                style: TextStyle(
                  fontSize: TextSize.extra,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 18.0,
                        color: Palette.star,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '4,6',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Palette.star,
                          fontSize: TextSize.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 18.0,
                        color: Palette.grey_50,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '300m',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Palette.grey_50,
                          fontSize: TextSize.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Material(
          //       elevation: 6.0,
          //       shadowColor: Colors.black45,
          //       shape: StadiumBorder(),
          //       clipBehavior: Clip.antiAlias,
          //       color: Palette.primary,
          //       child: InkWell(
          //         onTap: () {},
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 32.0,
          //             vertical: 16.0,
          //           ),
          //           child: Text(
          //             'SECGLI ME',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recensioni',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'INVIA',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Palette.primary.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.send,
                    color: Palette.primary.withOpacity(0.5),
                    size: 16.0,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Material(
            color: Palette.secondary,
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Lascia anche tu una recensione',
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Divider(),
          SizedBox(height: 8.0),
          Material(
            color: Palette.secondary,
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '06/04/2020',
                    style: TextStyle(
                      color: Palette.grey_50,
                      fontWeight: FontWeight.w700,
                      fontSize: TextSize.smol,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Simone è stato molto bravo, onesto e veloce. Il migliore di Usmate Velate. Lo consiglio vivamente. 5 stelle!!',
                    style: TextStyle(
                      fontSize: TextSize.h3,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: List.filled(
                          5,
                          Icon(
                            Icons.star,
                            size: 18.0,
                            color: Palette.star,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Mario Rossi',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          CircleAvatar(
                            radius: 10.0,
                            backgroundImage: AssetImage('res/pizio.jpeg'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 48.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(
                width: 3.0,
                color: Palette.accent,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'SEGNALA',
                  style: TextStyle(
                    color: Palette.accent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
