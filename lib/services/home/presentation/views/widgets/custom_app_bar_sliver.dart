import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vision_tech/services/home/presentation/views/contact_us/view/contact_us_view.dart';

class CustomAppBarSliver extends StatelessWidget {
  const CustomAppBarSliver({super.key, this.leadingWidget});

  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset('assets/images/text_logo.png', width: 0.4.sw),
      floating: true,
      pinned: true,
      backgroundColor: Color(0xff220A0A),
      leadingWidth: leadingWidget != null ? 0.1.sw : 0.3.sw,
      centerTitle: true,
      leading:
          leadingWidget ??
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.yellowAccent,
                  size: 20.sp,
                ),
                onPressed: () async {
                  const url = "tel:+201027975697";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    // This means the device can't handle `tel:` links
                    debugPrint('Could not launch $url');
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.yellowAccent,
                  size: 20.sp,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ContactUsView.routeName);
                },
              ),
            ],
          ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.yellowAccent, size: 20.sp),
        ),
      ],
    );
  }
}
