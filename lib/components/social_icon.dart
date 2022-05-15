import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconWithLinks extends StatelessWidget {
  final String image;
  final String url;
  SocialIconWithLinks({required this.image, required this.url});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: _lunchUrl,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: size.width * 0.023,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }

  _lunchUrl() async {
    bool isLunched = await launchUrl(Uri.parse(url));
    if (!isLunched) throw 'Could not launch $url';
  }
}
