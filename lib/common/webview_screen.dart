import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {

  static const String routeName = '/webview_screen';

  final String URL;

  const WebviewScreen({
    super.key,
    required this.URL,
    });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  @override
  Widget build(BuildContext context) {

  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse(widget.URL));

    return Scaffold(
      appBar: AppBar(
        title: Text('Webview'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}