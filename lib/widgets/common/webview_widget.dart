import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';
import 'package:onemilegreen_front/widgets/common/back_arrow_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OmgWebViewWidget extends StatefulWidget {
  OmgWebViewWidget(this.url, {super.key});
  String url;
  @override
  State<OmgWebViewWidget> createState() => _OmgWebViewWidgetState();
}

class _OmgWebViewWidgetState extends State<OmgWebViewWidget> {
  bool isLoading = true;
  double loadingProgress = 0;

  late WebViewController controller;

  void onPregress(int progress) {
    setState(() {
      loadingProgress = progress / 100;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            onPregress(progress);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackArrowAppBar(
        title: '',
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          if (isLoading) ...[
            Center(
              child: SizedBox(
                height: 60.w,
                width: 60.w,
                child: const CircularProgressIndicator(
                  color: OmgColors.primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                "${(loadingProgress * 100).toInt().toString()}%",
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
          WebViewWidget(controller: controller),
        ],
      ),
    );
  }
}
