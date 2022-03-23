import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/models/enroll_data.dart';

class EnrollmentRoute extends StatelessWidget {
  static final routeName = "enrollment_route";
  const EnrollmentRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("My Enrollment Data",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black)),
      ),
      body: Obx(() {
        return _controller.enrollDataList.isNotEmpty
            ? ListView.builder(
                itemCount: _controller.enrollDataList.length,
                itemBuilder: (_, index) {
                  final data = _controller.enrollDataList[index];
                  return AspectRatio(
                    aspectRatio: 16 / 4,
                    child: Card(
                      elevation: 5,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Name,Phone and Date ListTile
                            Flexible(
                              flex: 2,
                              child: ListTile(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Specific Enrollment Informations",
                                    titleStyle: TextStyle(fontSize: 12),
                                    radius: 5,
                                    content: enrollmentInformation(data: data),
                                  );
                                },
                                title: Text("${data.name} ${data.phoneNumber}"),
                                subtitle: Text(
                                    "${data.dateTime?.day}/${data.dateTime?.month}/${data.dateTime?.year}"),
                              ),
                            ),
                            //PhotoView Profile
                            imageWidget(data.facebookProfileSsImage),
                            imageWidget(data.bankSsImage),
                            //PhotoView BankSS
                          ]),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                "No enrollment data yet!",
                style: TextStyle(color: Colors.black),
              ));
      }),
    );
  }
}

Widget enrollmentInformation({required EnrollData data}) {
  return Column(
    children: [
      Text(""),
      //Student name and phone number
      Text(data.name),
      Text(data.phoneNumber),
      SizedBox(
        height: data.courseNameList.length * 30,
        child: ListView.builder(
          itemCount: data.courseNameList.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Count
                Text("${index + 1}"),
                //Course Name
                Text("${data.courseNameList[index]}"),
              ],
            );
          },
        ),
      )
    ],
  );
}

Widget imageWidget(String imageString) {
  return Flexible(
    flex: 1,
    child: InkWell(
      onTap: () {
        //Show Dialog PhotoView
        showDialog(
          //barrierColor: Colors.white.withOpacity(0),
          context: Get.context!,
          builder: (context) {
            return photoViewer(heroTags: imageString);
          },
        );
      },
      child: Hero(
        tag: imageString,
        child: CachedNetworkImage(
          imageUrl: imageString,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, status) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: status.progress,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}

//PhotoViewer
Widget photoViewer({required String heroTags}) {
  return Center(
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: PhotoView(
        imageProvider: NetworkImage(heroTags),
        loadingBuilder: (context, progress) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: const CircularProgressIndicator(),
          ),
        ),
        backgroundDecoration: BoxDecoration(color: Colors.white.withOpacity(0)),
        gaplessPlayback: false,
        //customSize: MediaQuery.of(context).size,
        heroAttributes: PhotoViewHeroAttributes(
          tag: heroTags,
          transitionOnUserGestures: true,
        ),
        //scaleStateChangedCallback: this.onScaleStateChanged,
        enableRotation: true,
        //controller:  controller,
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 3,
        initialScale: PhotoViewComputedScale.contained,
        basePosition: Alignment.center,
        //scaleStateCycle: scaleStateCycle
      ),
    ),
  );
}
