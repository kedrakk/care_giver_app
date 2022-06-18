import 'package:care_giver/const/theme.dart';
import 'package:care_giver/controller/hospital_controller.dart';
import 'package:care_giver/repo/hospital_repo.dart';
import 'package:care_giver/widget/hospital_card_widget.dart';
import 'package:care_giver/widget/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital'),
      ),
      body: GetBuilder<HospitalController>(
        init: HospitalController(Get.find<HospitalRepo>()),
        builder: (controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : (controller.errorMessage.isNotEmpty &&
                    controller.currentPosition == null
                ? Center(child: Text('Error: ${controller.errorMessage}'))
                : Stack(
                    children: [
                      MapWidget(
                        markers: controller.markers,
                        mapType: controller.mapType,
                        latitude: controller.currentPosition!.latitude,
                        longitude: controller.currentPosition!.longitude,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: controller.hospitalList.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.hospitalList.length,
                                itemBuilder: (context, index) =>
                                    HospitalCardWidget(
                                  hospital: controller.hospitalList[index],
                                ),
                              )
                            : Container(
                                color: AppTheme.tertiary,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  controller.errorMessage.isNotEmpty
                                      ? controller.errorMessage
                                      : 'No hospitals found',
                                  style: const TextStyle(
                                    color: AppTheme.octonary,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        right: 0,
                        child: FloatingActionButton(
                          onPressed: () => controller.changeMapType(),
                          child: const Icon(
                            Icons.map_outlined,
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
