import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'index.dart';

class HtmlRenderer extends StatefulWidget {
  final String html;

  const HtmlRenderer({
    Key? key,
    required this.html,
  }) : super(key: key);

  @override
  State<HtmlRenderer> createState() => _HtmlRendererState();
}

class _HtmlRendererState extends State<HtmlRenderer> {
  late Future<String> urlFuture;
  bool loaded = false;

  String _getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes), mimeType: mime).toString();
  }

  Future<String> getFontStyleBlock(String fontAssetPath, String fontBoldAssetPath, String fontMime) async {
    final fontData = await rootBundle.load(fontAssetPath);
    final fontBoldData = await rootBundle.load(fontBoldAssetPath);
    final fontUri = _getFontUri(fontData, fontMime).toString();
    final fontBoldUri = _getFontUri(fontBoldData, fontMime).toString();
    final fontCss =
        '@font-face { font-family: customFont; src: url($fontUri); } @font-face { font-family: customFont; src: url($fontBoldUri); font-weight: bold; } * { font-family: customFont; }';
    return '<style>$fontCss</style>';
  }

  Future<String> _modifyHtml(String html) async {
    if (kDebugMode) {
      html = html.replaceAll('http://localhost:8000', AppStrings.apiUrl);
    }
    String styleBlock = await getFontStyleBlock("assets/fonts/nokora/Nokora-Nunitosans-Regular.ttf", "assets/fonts/nokora/Nokora-Nunitosans-Bold.ttf", "font/opentype");
    var backgroundColor = AppColors.toHex(Get.theme.scaffoldBackgroundColor);

    return """
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta charset="UTF-8">
      $styleBlock
      <style>
        html, body {
          background-color: #$backgroundColor;
        }
        body {
          padding: 1em 0.3em 3em 0.3em;
        }
        table img {
          width: 100%;
        }
        figure {
          margin: 0.9em auto;
        }
        tr {
          background-color: rba(249, 250, 251);
        }
        td {
          border: 0.8px solid #b3b3b3;
          padding: 0.5em;
        }
        table {
          border-collapse: collapse;
          border-spacing: 0;
        }
        p {
          margin: 0.9em 0;
        }
      </style>
    </head>
    <body>$html</body>
    """;
  }

  Future<String> getPageUri() async {
    return Uri.dataFromString(
      await _modifyHtml(widget.html),
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
  }

  @override
  void initState() {
    urlFuture = _modifyHtml(widget.html);//getPageUri();
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    } else if (Platform.isIOS) {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: urlFuture,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Stack(
          children: [
            if (snapshot.hasData)
              WebView(
                zoomEnabled: false,
                // gestureRecognizers: {
                //   Factory<TapGestureRecognizer>(() => TapGestureRecognizer()
                //     ..onTapDown = (tap) {
                //       print(tap.globalPosition);
                //     })
                // },
                initialUrl: null,//snapshot.data!,
                gestureNavigationEnabled: true,
                navigationDelegate: (request) {
                  print(request.url);
                  if (request.url.startsWith(RegExp('(https|http|mail|tel|sms)://'))) {
                  // if (!request.url.startsWith(snapshot.data!)) {
                    try {
                      launchUrl(Uri.parse(request.url));
                    } catch (e) {
                      print(e);
                    }
                    return NavigationDecision.prevent;
                  } else {
                    return NavigationDecision.navigate;
                  }
                },
                onWebViewCreated: (controller) async {
                  controller.loadHtmlString(snapshot.data!);
                  Future.delayed(
                    const Duration(milliseconds: 400),
                    () {
                      setState(() {
                        loaded = true;
                      });
                    },
                  );
                },
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                javascriptMode: JavascriptMode.unrestricted,
              )
            else
              const SizedBox.expand(),
            if (!loaded)
              Positioned.fill(
                child: Material(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
