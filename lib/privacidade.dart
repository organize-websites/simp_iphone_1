import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacidade extends StatefulWidget {
  @override
  _PrivacidadeState createState() => _PrivacidadeState();
}

class _PrivacidadeState extends State<Privacidade> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: WebView(
              initialUrl: 'https://agencialink.com/privacidade.php',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
          );
        }
      ),
      bottomNavigationBar: 
      SizedBox(
      height: 60,
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(42, 69, 124, 1),
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: IconButton( 
                icon: Icon(Icons.arrow_back, color: Colors.white,), 
                onPressed: (){Navigator.pop(context);}
              ) 
            ),
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white,), 
                onPressed: (){exit(0);},
              ) 
            ),
          ],
        ),
      ),
    );
  }
}