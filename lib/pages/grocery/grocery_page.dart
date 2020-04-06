import 'package:covidelivery/misc/palette.dart';
import 'package:covidelivery/misc/text_size.dart';
import 'package:covidelivery/models/grocery_item.dart';
import 'package:fitted_text_field_container/fitted_text_field_container.dart';
import 'package:flutter/material.dart';

class GroceryPage extends StatefulWidget {
  @override
  _GroceryPageState createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  bool groceryAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: CloseButton(),
      ),
      body: PageView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ho bisogni di qualcuno che mi faccia la spesa',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TextSize.h1,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            Text(
                              'Negozio',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: TextSize.text,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Material(
                              color: Palette.primary,
                              borderRadius: BorderRadius.circular(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 16.0),
                                    Text(
                                      'Esselunga, Via Luigi XVIII 37, 24805',
                                      style: TextStyle(
                                        fontSize: TextSize.text,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 32.0),
                            Text(
                              'Lista della spesa',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: TextSize.text,
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          AddGroceryTile(onTap: () {
                            Future.delayed(Duration(seconds: 2),
                                () => setState(() => groceryAdded = true));
                          }),
                          if (groceryAdded)
                            GroceryTile(
                              item: GroceryItem(
                                title: 'Spaghetti',
                                brand: 'Barilla',
                                quantity: '500',
                                moreInfo: 'Numero 7 sennò numero 4',
                              ),
                            ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lista volontari disponibili',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TextSize.h1,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          VolunteerTile(
                              // item: GroceryItem(
                              //   title: 'Spaghetti',
                              //   make: 'Barilla',
                              //   quantity: '500',
                              //   moreInfo: 'Numero 7 sennò numero 4',
                              // ),
                              ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ProfileSection(),
          PaymentSection(),
        ],
      ),
    );
  }
}

class AddGroceryBottomSheet extends StatefulWidget {
  @override
  _AddGroceryBottomSheetState createState() => _AddGroceryBottomSheetState();
}

class _AddGroceryBottomSheetState extends State<AddGroceryBottomSheet> {
  TextEditingController _qtaTxt = TextEditingController();
  TextEditingController _productTxt = TextEditingController();
  TextEditingController _brandTxt = TextEditingController();
  TextEditingController _moreInfoTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Palette.scaffold_background,
        child: Padding(
          padding: const EdgeInsets.all(32.0).copyWith(bottom: 400.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Voglio',
                style: TextStyle(
                  fontSize: TextSize.extra,
                ),
              ),
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _qtaTxt.text.length > 0 ? _qtaTxt.text : 'quantità',
                        style: TextStyle(
                          fontWeight: _qtaTxt.text.length > 0
                              ? FontWeight.w700
                              : FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: _qtaTxt.text.length > 0
                              ? Colors.black
                              : Palette.grey_50,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'grammi',
                        style: TextStyle(
                          fontSize: TextSize.extra,
                          color: Palette.primary,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Palette.primary,
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: TextField(
                      controller: _qtaTxt,
                      onChanged: (text) {
                        print(text);
                        setState(() {});
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: Palette.grey_50,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: TextSize.extra,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'di',
                        style: TextStyle(
                          fontSize: TextSize.extra,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        _productTxt.text.length > 0
                            ? _productTxt.text
                            : 'prodotto',
                        style: TextStyle(
                          fontWeight: _productTxt.text.length > 0
                              ? FontWeight.w700
                              : FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: _productTxt.text.length > 0
                              ? Colors.black
                              : Palette.grey_50,
                        ),
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: TextField(
                      controller: _productTxt,
                      onChanged: (text) {
                        print(text);
                        setState(() {});
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: Palette.grey_50,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: TextSize.extra,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'della',
                        style: TextStyle(
                          fontSize: TextSize.extra,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        _brandTxt.text.length > 0 ? _brandTxt.text : 'marca',
                        style: TextStyle(
                          fontWeight: _brandTxt.text.length > 0
                              ? FontWeight.w700
                              : FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: _brandTxt.text.length > 0
                              ? Colors.black
                              : Palette.grey_50,
                        ),
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: TextField(
                      controller: _brandTxt,
                      onChanged: (text) {
                        print(text);
                        setState(() {});
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TextSize.extra,
                          color: Palette.grey_50,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: TextSize.extra,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Material(
                color: Palette.secondary,
                borderRadius: BorderRadius.circular(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Descrizione aggiuntiva',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Material(
                elevation: 6.0,
                shadowColor: Colors.black45,
                shape: StadiumBorder(),
                clipBehavior: Clip.antiAlias,
                color: Palette.primary,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          'CONTINUA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddGroceryTile extends StatelessWidget {
  final Function() onTap;
  const AddGroceryTile({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          onTap();
          showModalBottomSheet(
            context: context,
            builder: (context) => AddGroceryBottomSheet(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.grey_text,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.add),
                SizedBox(width: 16.0),
                Text(
                  'Aggiungi un prodotto',
                  style: TextStyle(
                    fontSize: TextSize.text,
                    fontWeight: FontWeight.w700,
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

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  const GroceryTile({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Palette.secondary,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${item.title}, ${item.quantity}${item.quantitySuffix}',
                          style: TextStyle(
                            fontSize: TextSize.h2,
                          ),
                        ),
                        if (item.brand != null && item.brand.length >= 1)
                          Text(
                            item.brand[0].toUpperCase() +
                                item.brand.substring(1),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: TextSize.smol,
                              color:
                                  item.brand != null && item.brand.length >= 1
                                      ? Colors.black
                                      : Palette.grey_50,
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              if (item.moreInfo != null) ...[
                SizedBox(height: 12.0),
                Text(
                  item.moreInfo,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: TextSize.text,
                    color: Palette.grey_50,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class VolunteerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.fromRadius(32.0),
            child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'res/pizio.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 4.0,
                          backgroundColor: Palette.accent,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          'OCCUPATO',
                          style: TextStyle(
                            fontSize: 10.0,
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
                        fontSize: 10.0,
                        color: Palette.accent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Pizio Leonardo',
                  style: TextStyle(
                    fontSize: TextSize.h2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 16.0,
                          color: Palette.star,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '4,6',
                          style: TextStyle(
                            color: Palette.star,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 16.0,
                          color: Palette.grey_50,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '300m',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Palette.grey_50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.keyboard_arrow_right,
              // color: Palette.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              elevation: 6.0,
              shadowColor: Colors.black45,
              shape: StadiumBorder(),
              clipBehavior: Clip.antiAlias,
              color: Palette.primary,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'SCEGLI ME',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32.0),
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
    );
  }
}

class PaymentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.fromRadius(36.0),
            child: Material(
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'res/pizio.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Text.rich(
            TextSpan(
              text: 'Paga ',
              children: [
                TextSpan(
                  text: 'Pizio Leonardo',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            style: TextStyle(fontSize: TextSize.h1),
          ),
          Text(
            '€ 5,00',
            style: TextStyle(
              fontSize: 64.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 64.0),
          Text(
            'Leonardo accetta solo il pagamento in contanti',
            style: TextStyle(
              // fontSize: 64.0,
              fontSize: TextSize.text,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3.0,
                color: Palette.primary,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      accentColor: Palette.primary,
                    ),
                    child: Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'In contanti',
                    style: TextStyle(
                      fontSize: TextSize.text,
                      fontWeight: FontWeight.w700,
                      color: Palette.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Spacer(),
                Material(
                  elevation: 6.0,
                  shadowColor: Colors.black45,
                  shape: StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Palette.primary,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 16.0,
                          ),
                          child: Text(
                            'CONTINUA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
