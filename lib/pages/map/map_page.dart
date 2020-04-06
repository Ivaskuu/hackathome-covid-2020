import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/misc/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng latLng;
  bool msgSent = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then(
          (pos) => setState(
            () => latLng = LatLng(
              pos.latitude,
              pos.longitude,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (latLng != null)
          SizedBox.expand(
            child: FlutterMap(
              options: MapOptions(
                center: latLng,
                zoom: 16.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
          ),
        DraggableScrollableSheet(
          minChildSize: 0.4,
          initialChildSize: 0.4,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  4.0 -
                  32.0 -
                  MediaQuery.of(context).padding.bottom,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Material(
                  elevation: 12.0,
                  color: Palette.scaffold_background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size.fromRadius(32.0),
                              child: Material(
                                shape: CircleBorder(),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  'res/simone.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Simone Scino',
                                    style: TextStyle(
                                      fontSize: TextSize.h2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('sta effettuando la consegna'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.message,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 2.5,
                                  color: Palette.primary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 2.5,
                                  color: Palette.primary.withOpacity(0.2),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: Palette.primary,
                                  child: Icon(
                                    Icons.done,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  radius: 10.0,
                                  backgroundColor: Palette.primary,
                                  child: Icon(
                                    Icons.done,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  radius: 6.0,
                                  backgroundColor: Palette.primary,
                                  child: CircleAvatar(
                                    radius: 4.0,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  radius: 6.0,
                                  backgroundColor: Palette.primary.withOpacity(
                                    0.2,
                                  ),
                                  child: CircleAvatar(
                                    radius: 4.0,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  radius: 6.0,
                                  backgroundColor: Palette.primary.withOpacity(
                                    0.2,
                                  ),
                                  child: CircleAvatar(
                                    radius: 4.0,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Step 3 di 5',
                              style: TextStyle(
                                color: Palette.primary,
                                fontSize: TextSize.smol,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Spostamento al supermercato',
                              style: TextStyle(
                                fontSize: TextSize.h2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            OtherChat(
                              dateTime: '12:04',
                              text: 'Non trovo la Coca cola. Va bene la Pepsi?',
                            ),
                            MineChat(
                              dateTime: '12:05',
                              text:
                                  'No piuttosto prendi la Fanta al gusto di arancia rossa',
                            ),
                            OtherChat(
                              dateTime: '12:06',
                              text: 'Certo, nessun problema',
                            ),
                            if (msgSent)
                              MineChat(
                                dateTime: '12:07',
                                text: 'Grazie',
                              ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8.0,
                        ),
                        child: Material(
                          shape: StadiumBorder(),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Palette.primary,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: controller,
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Scrivi qualcosa',
                                  ),
                                ),
                              ),
                              SizedBox.fromSize(
                                size: Size.fromRadius(22.0),
                                child: Material(
                                  color: Palette.primary,
                                  shape: CircleBorder(),
                                  elevation: 6.0,
                                  shadowColor: Colors.black45,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        msgSent = true;
                                        controller.clear();
                                      });
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4.0),
                            ],
                          ),
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
    );
  }
}

class OtherChat extends StatelessWidget {
  final String text;
  final String dateTime;

  const OtherChat({
    Key key,
    @required this.text,
    @required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ).copyWith(
          right: 128.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size.fromRadius(20.0),
              child: Material(
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'res/pizio.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    color: Palette.secondary,
                    borderRadius: BorderRadius.circular(16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(text),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    dateTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Palette.grey_text,
                      fontSize: 12.0,
                    ),
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

class MineChat extends StatelessWidget {
  final String text;
  final String dateTime;

  const MineChat({
    Key key,
    @required this.text,
    @required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ).copyWith(left: 128.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Palette.primary,
              borderRadius: BorderRadius.circular(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              dateTime,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Palette.grey_text,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
