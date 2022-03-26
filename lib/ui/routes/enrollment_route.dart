import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kzn/controller/main_controller.dart';
import 'package:kzn/data/constant.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../data/models/enroll_data.dart';

class EnrollmentRoute extends StatelessWidget {
  static final routeName = "enrollment_route";
  const EnrollmentRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    MainController _controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("A 1 Student Enrolled Information",
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
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Name,Phone and Date ListTile
                            Flexible(
                              flex: 3,
                              child: ListTile(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Student Enrolled Information",
                                    titleStyle: inputLabel,
                                    radius: 5,
                                    content: enrollmentInformation(
                                        data: data, size: screenSize),
                                  );
                                },
                                title: Text("${data.name} ${data.phoneNumber}"),
                                subtitle: Text(
                                    "${data.dateTime?.day}/${data.dateTime?.month}/${data.dateTime?.year}"),
                              ),
                            ),
                            //PhotoView Profile
                            imageWidget(data.facebookProfileSsImage),
                            SizedBox(
                              width: 20,
                            ),
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

Widget enrollmentInformation({required EnrollData data, required Size size}) {
  return SizedBox(
    height: size.height * 0.7,
    width: size.width * 0.8,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Student name and phone number
          Text("Name: ${data.name}"),
          Text("Phone number: ${data.phoneNumber}"),
          Text("Payment: ${data.paymentAccName}"),
          const SizedBox(height: 15),
          Text("Enroll courses", style: inputLabel),
          const SizedBox(height: 10),
          SizedBox(
            height: data.courseList.length * 50,
            child: ListView.builder(
              itemCount: data.courseList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Wrap(
                    children: [
                      //Count
                      Text(
                        "${index + 1}. ",
                      ),
                      //Course Name
                      Text("${data.courseList[index]["name"]}",
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                );
              },
            ),
          ),
          //Total Price
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "စုစုပေါင်း: ${data.totalPrice}ကျပ်",
              )),
        ],
      ),
    ),
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
