import 'package:kb_app/view/absensi.dart';
import 'package:kb_app/view/lembur.dart';
import 'package:kb_app/view/spkanggota.dart';
import 'package:kb_app/view/location.dart';
import 'package:kb_app/view/permit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userid = "",
      username = "",
      namalengkap = "",
      jabatan = "",
      nik = "",
      foto = "",
      urlfoto = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString("id");
      username = preferences.getString("username");
      namalengkap = preferences.getString("nama");
      jabatan = preferences.getString("jabatan");
      nik = preferences.getString("nik");
      foto = preferences.getString("foto");
      urlfoto = foto;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  static final List<String> imgSlider = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'images/slider/${fileImage}',
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          autoPlayImage,
          Divider(
            color: Colors.white,
          ),
          Akun(
            userid: userid,
            username: username,
            namalengkap: namalengkap,
            jabatan: jabatan,
            nik: nik,
            url: urlfoto,
          ),
          Divider(
            color: Colors.white,
          ),
          MenuUtama(),
        ],
      ),
    );
  }
}

class Akun extends StatelessWidget {
  String userid, username, namalengkap, jabatan, kodekantor, nik, url;
  Akun(
      {this.userid,
      this.username,
      this.namalengkap,
      this.jabatan,
      this.nik,
      this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber[700],
      child: new GestureDetector(
        onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => null)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 100.0,
            ),
            title: Text(
              nik ?? '25361253',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  namalengkap ?? 'User demo',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                new Text(
                  jabatan ?? 'Manager',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber[700],
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: <Widget>[
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.lightBlue[700],
                  child: IconButton(
                    icon: Icon(Icons.access_alarms_rounded),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => Absensi()));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Presensi',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.lightBlue[700],
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => Permit()));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Izin',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.lightBlue[700],
                  child: IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => LocationArea()));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Set lokasi',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.lightBlue[700],
                  child: IconButton(
                    icon: Icon(Icons.photo_album_rounded),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => Dokum()));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Dokum',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.lightBlue[700],
                  child: IconButton(
                    icon: Icon(Icons.watch),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => WebViewSAW()));
                    },
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    iconSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'SPK',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
