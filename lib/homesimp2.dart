import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simp_iphone_1/ajuda.dart';
import 'package:simp_iphone_1/mudausr.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'cardcor.dart';
import 'homeb2cor.dart';

class HomeSimp3n extends StatefulWidget {

  static Future<String> get _usrnm async {

  var prefs = await SharedPreferences.getInstance();
  String nome = (prefs.getString("nome") ?? "");

    await Future.delayed(Duration(seconds: 1));
    return '$nome';
  }

  static Future<String> get _usrimg async {

  var prefs = await SharedPreferences.getInstance();
  String logotipousuario = (prefs.getString("logotipousuario") ?? "");

    await Future.delayed(Duration(seconds: 1));
    return '$logotipousuario';
  }  

  static Future<String> get _uslog async {

  var prefs = await SharedPreferences.getInstance();
  String login = (prefs.getString("login") ?? "");

    await Future.delayed(Duration(seconds: 1));
    return '$login';
  }  
  

  @override
  _HomeSimp3nState createState() => _HomeSimp3nState();
}

class _HomeSimp3nState extends State<HomeSimp3n> {  

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  clearUsr() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();  
  
  @override
  Widget build(BuildContext context) => Scaffold(
    key: _scaffoldKey,
    body: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: WebView(
        initialUrl: 'https://dashboard.simp.agencialink.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),
    drawer: 
    ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: 
      Drawer(
        child: 
        Container(
          color: Colors.white,
          child: 
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 0, right: 80, left: 80),
                      child: Image.asset('imagens/logo.png'),
                    ),
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Divider(),
                    ),   
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    ListTile(
                      leading: FutureBuilder(
                        future: HomeSimp3n._usrimg,
                        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
                        ? Container(width: 70, height: 100, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(snapshot.data,) )),)
                        : CircularProgressIndicator()
                      ),
                      title: FutureBuilder(
                        future: HomeSimp3n._usrnm,
                        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
                        ? Text(snapshot.data, style: TextStyle(fontSize: 13),)
                        : CircularProgressIndicator()
                      ),
                      subtitle: FutureBuilder(
                        future: HomeSimp3n._uslog,
                        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot.hasData
                        ? Text(snapshot.data, style: TextStyle(fontSize: 10),)
                        : CircularProgressIndicator()
                      ),
                    ),
                    Center(
                      child:
                      TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MudaUsr()));}, child: Text('Trocar Usuário'))
                    )
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Divider(),
                    ),   
                  ]
                )
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                delegate: SliverChildListDelegate(
                  [
                    TextButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSimp3n()));},
                      child: 
                      Column(
                        children: [
                          Image.asset('imagens/ic_launcher.png', width: 50, height: 50,),
                          Text('SIMP', style: TextStyle(color: Colors.grey[700]))
                        ],
                      )
                    ),
                    TextButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Homeb2cor()));},
                      child: 
                      Column(
                        children: [
                          Image.asset('imagens/b2cor.png', width: 50, height: 50,),
                          Text('B2Cor', style: TextStyle(color: Colors.grey[700]))
                        ],
                      )
                    ),
                    TextButton(
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CardCor()));},
                      child: 
                      Column(
                        children: [
                          Image.asset('imagens/card.png', width: 50, height: 50,),
                          Text('CardCor', style: TextStyle(color: Colors.grey[700]))
                        ],
                      )
                    ),
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Divider(),
                    ),   
                  ]
                )
              ),
              SliverList(
                delegate: 
                SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Suporte', style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),
                          ),
                          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Ajuda()));}, child: Text('  Base de Conhecimento')),                
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        verticalDirection: VerticalDirection.up,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 105, right: 105),
                            child: Image.asset('imagens/ag.png'),
                          )
                        ],
                      ),
                    ) 
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    ),
    bottomNavigationBar: 
    SizedBox(
      height: 60,
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(52, 58, 64, 1),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              icon: Icon(Icons.home, color: Colors.white,), 
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSimp3n()));}
            ) 
          ),
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              icon: Icon(Icons.apps, color: Colors.white,), 
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ) 
          ),
          BottomNavigationBarItem(
            label: '',
            icon: IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white,), 
              onPressed: (){clearUsr(); Navigator.push(context, MaterialPageRoute(builder: (context) => MudaUsr()));},
            ) 
          ),
        ],
      ),
    ),
  );
}



