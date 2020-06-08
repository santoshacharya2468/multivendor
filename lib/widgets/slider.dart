import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkshopsonline/models/deal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ImageSlider extends StatefulWidget {
  final List<Deal> deals;
  ImageSlider(this.deals);
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<ImageSlider> {
  // YoutubePlayerController _youtubePlayerController;
  // @override
  // void initState() {
  //   super.initState();
  //   _youtubePlayerController = YoutubePlayerController(
  //     initialVideoId: 'iLnmTe5Q2Qw',
  //     flags: YoutubePlayerFlags(
  //       autoPlay: false,
  //       mute: true,
  //     ),
  //   );
  // }

  // @override
  // void dispose() {
  //   _youtubePlayerController.dispose();
  //   super.dispose();
  // }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: deviceSize.width,
          height: 200.0,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: widget.deals.length,
                itemBuilder: (context, index) {
                  var deal = widget.deals[index];
                  if (deal.isImage) {
                    return Image.asset(
                      deal.mediaUrl,
                      fit: BoxFit.cover,
                      width: deviceSize.width,
                    );
                  } else {
                    return Container(
                      height: 200.0,
                      width: deviceSize.width,
                      color: Colors.grey,
                      child: Center(
                        child: IconButton(
                          iconSize: 60.0,
                          color: Colors.redAccent,
                          icon: Image.asset(
                            "assets/images/youtube.png",
                          ),
                          onPressed: () {
                            launcher.launch(deal.mediaUrl);
                          },
                        ),
                      ),
                    );
                  }
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'latest_deals');
                },
                child: Container(
                  height: 30.0,
                  width: 80.0,
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Text(
                    "All Deals",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.deals.map((url) {
            int index = widget.deals.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
       
      ],
    );
  }
}
