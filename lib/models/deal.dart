
class Deal{
  String mediaUrl;
  String caption;
  //media may be video or image
  bool isImage;
  //this is only for video containing deal
  String bannerImage;
  Deal({this.mediaUrl,this.caption,this.isImage,this.bannerImage});
}