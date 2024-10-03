import 'package:crop_yield/resources/color_resources.dart';
import 'package:crop_yield/resources/style_resources.dart';
import 'package:crop_yield/text/textfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  dynamic onValueGet;

  WebViewScreen(this.url, {required this.onValueGet});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController webViewController;
  var TAG = "WebViewScreen==>>>";
  var isDataGet = false;

  final GlobalKey webViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 0,
        backgroundColor: color_e8f0fb,
        toolbarHeight: 40,
        title: Text(
          TextFile.EstimateCropPrediction,
          style: heading6TextStyle(
              size: 16, colors: color_3d7ebd, fontWeight: FontWeight.bold),
        ),
      ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useOnLoadResource: true,
            allowFileAccessFromFileURLs: true,
            allowUniversalAccessFromFileURLs: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            // Page finished loading
          }
        },
        onLoadResource:
            (InAppWebViewController controller, LoadedResource resource) async {
          String script = """
            (function() {
              return document.body.innerText;
            })();
          """;
          try {
            var result =
                await webViewController.evaluateJavascript(source: script);
            // print('$TAG Text content after upload: $result');
            if (!isDataGet) {
              _processExtractedText(result, context);
            }
          } catch (e) {
            print('$TAG Error: $e');
          }
          // }
        },
      ),
    );
  }

  void _processExtractedText(String text, BuildContext context) {
    // Regex to match values within square brackets
    RegExp regExp = RegExp(r'\[([0-9\.]+)\]');
    Iterable<Match> matches = regExp.allMatches(text);
    // print('$TAG Text content after upload: $matches');

    // Extract and print each match
    for (Match match in matches) {
      String value = match.group(1) ?? '';
      // print('$TAG Text content after upload11111111111: $value');
      print('$TAG Extracted value: $value');
      isDataGet = true;
      setState(() {});
      widget.onValueGet(value);
      break;
    }
  }
}
