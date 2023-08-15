import 'package:defaultproject/view/content/content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController HC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[900],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  searchBox(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(

                    child: Obx(()=> Container(
                      child: GridView.builder(
                        shrinkWrap: true,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: HC.titles.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(ContentPage(), arguments: [HC.titles[index], HC.data[index], index]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[500],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(HC.titles.value[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey[900]
                                          ),
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                    Text(HC.data.value[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey[700]
                                      ),
                                      overflow: TextOverflow.ellipsis,)
                                  ],
                                ),


                              ),
                            ),
                          );
                        },
                      ),
                    ))
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: (){
              Get.to(ContentPage(), arguments: ["", "", -1]);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                CupertinoIcons.plus,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[700], // Darker background color
        borderRadius: BorderRadius.circular(15), // Rounder corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              //onChanged: (value) => _runFilter(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}