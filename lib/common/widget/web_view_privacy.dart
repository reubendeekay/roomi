import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPrivacy extends StatefulWidget {
  const WebViewPrivacy({this.url, this.title});
  final String url;
  final String title;
  @override
  _WebViewPrivacyState createState() => _WebViewPrivacyState();
}

class _WebViewPrivacyState extends State<WebViewPrivacy> {
  Future<String> get _url async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            )),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: FutureBuilder(
        future: _url,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return WebView(
              initialUrl: snapshot.data,
              javascriptMode: JavascriptMode.unrestricted,
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(
              animating: true,
            ),
          );
        },
      ),
    );
  }
}
