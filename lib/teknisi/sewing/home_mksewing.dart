import 'package:flutter/material.dart';
import 'package:siap/constans.dart';
import 'package:siap/models/menus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class HomeMksewing extends StatefulWidget {
  @override
  _HomeMksewingState createState() => new _HomeMksewingState();
}

class _HomeMksewingState extends State<HomeMksewing> {
  int _jumlahPesan = 0;
  //late bool _showPesan;
  Color color = Colors.red;
  late SharedPreferences _preferences;
  late String nama = '';
  late String nopid = '';
  late String? token = '';

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _loadStoredValue();
  }

  Future<void> _loadStoredValue() async {
    setState(() {
      nopid = _preferences.getString("sp_pid") ?? '';
      token = _preferences.getString("sp_token");
      nama = _preferences.getString("sp_nama") ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: AppBar(
          elevation: 0.25,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 50,
                  width: 100,
                ),
                Container(
                  child: Row(
                    children: [
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeAnimation: badges.BadgeAnimation.slide(),
                        badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                        showBadge: _jumlahPesan == 0 ? false : true,
                        badgeContent: Text(
                          _jumlahPesan.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: new Container(
          child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0),
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildGopayMenu(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildGojekServicesMenu(),
                    ],
                  )),
              new Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: new Column(
                  children: <Widget>[
                    //     _buildGoFoodFeatured(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//header warna biru
  Widget _buildGopayMenu() {
    return new Container(
      height: 120.0,
      decoration: new BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(3.0))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome :",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: "NeoSans"),
                  ),
                  Text(
                    nama.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG3hfDQ3opvjbPAtpfByjhtO4RUCRtik8B5JFOgb6WlF7nhZCGqxWHtzVHXRmYrYxwPCc&usqp=CAU"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGojekServicesMenu() {
    return new SizedBox(
        width: double.infinity,
        height: 240.0,
        child: new Container(
          margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              MenuIcon(
                icon: Icons.directions_bike,
                iconColor: GojekPalette.menuRide,
                label: "Profile",
                onPres: () {
                  context.goNamed('mytiket',
                      params: {'pid': nopid, 'token': token ?? ''});
                },
              ),
              MenuIcon(
                icon: Icons.add_to_home_screen,
                iconColor: Colors.green,
                label: "Pulang",
                onPres: () {},
              ),
              MenuIcon(
                icon: Icons.deck_rounded,
                iconColor: Colors.purple,
                label: "Absen",
                onPres: () {},
              ),
              MenuIcon(
                icon: Icons.auto_stories,
                iconColor: Colors.green,
                label: "Kode Gaji ",
                onPres: () {},
              ),
              MenuIcon(
                icon: Icons.article_outlined,
                iconColor: Colors.orange,
                label: "SlipGaji",
                onPres: () {
                  // _showPesan = false;
                  _jumlahPesan = 2;
                  setState(() {});
                },
              ),
            ],
          ),
        ));
  }
}
