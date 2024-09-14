import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Import WebView package

class PrivacyPolicyScreen extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const WebView(
        initialUrl:
            'https://sites.google.com/view/ride-horse', // Replace with your actual URL
        javascriptMode: JavascriptMode.unrestricted, // Allow JavaScript
      ),
    );
  }
}
