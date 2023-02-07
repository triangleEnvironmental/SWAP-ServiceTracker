import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:moderator_app/app/constants/index.dart';

class ViewPhotoPage extends StatefulWidget {
  final List<ImageProvider> images;
  final int initIndex;
  final PageController pageController;

  ViewPhotoPage({
    required this.images,
    this.initIndex = 0,
    Key? key,
  })  : pageController = PageController(initialPage: initIndex),
        super(key: key);

  @override
  ViewPhotoPageState createState() => ViewPhotoPageState();
}

class ViewPhotoPageState extends State<ViewPhotoPage> {
  bool _showMenu = true;
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.initIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned.fill(
          child: Material(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _showMenu = !_showMenu;
            });
          },
          child: PhotoViewGallery.builder(
            pageController: widget.pageController,
            itemCount: widget.images.length,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            builder: (BuildContext context, int index) {
              var media = widget.images[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: media,
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.contained * 8,
                heroAttributes: PhotoViewHeroAttributes(tag: media),
              );
            },
            loadingBuilder: (context, ImageChunkEvent? event) => Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                  value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          top: _showMenu ? 0 : -(kToolbarHeight + Get.mediaQuery.padding.top),
          left: 0,
          right: 0,
          child: SizedBox(
            width: double.infinity,
            height: kToolbarHeight + Get.mediaQuery.padding.top,
            child: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back(closeOverlays: true);
                },
                icon: const Icon(
                  AppIcons.close,
                  color: Colors.white,
                ),
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                "${_currentPage + 1}/${widget.images.length}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black.withOpacity(0.5),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
        ),
      ],
    );
  }
}
