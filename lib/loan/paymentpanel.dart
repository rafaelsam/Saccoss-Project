import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// This is the type used by the popup menu below.
enum Options { profile, logout, info }

@immutable
class PaymentPanel extends StatefulWidget {
  PaymentPanel({Key? key}) : super(key: key);

  late String email = "";
  late String id = "";
  @override
  _PaymentPanelState createState() => _PaymentPanelState();
}

class _PaymentPanelState extends State<PaymentPanel> {
  var _popupMenuItemIndex = 0;
  late InAppWebViewController inAppWebViewController;
  late double _progress;

  @override
  void initState() {
    _progress = 0;

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Payment"),
      ),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
                    "https://saccos-app-f0b741b6acb8.herokuapp.com/loans-list/")),
            onWebViewCreated: (InAppWebViewController controller) {
              inAppWebViewController = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
        ),
        _progress < 1
            ? SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.blue.withOpacity(.5),
                ))
            : const SizedBox()
      ]),
    );
  }
}
