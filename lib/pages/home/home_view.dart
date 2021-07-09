import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radiosaphir/pages/home/home_controller.dart';
import 'package:radiosaphir/pages/home/radio_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatelessWidget {
  var controller = Get.put(HomeController());
  var radioController = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Radio Saphir", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(icon: Icon(Icons.share_outlined), onPressed: () => {}),
            IconButton(icon: Icon(Icons.info_outline), onPressed: () => {}),
          ],
        ),
        body: VStack([
          _radioWidget(),
          Expanded(
              child: ListView(
            children: [
              "Emissions"
                  .text
                  .color(Colors.black)
                  .textStyle(GoogleFonts.alikeAngular(fontSize: 20))
                  .make()
                  .pOnly(top: 15, left: 10),
              SizedBox(
                height: 5,
              ),
              _sliderComponent(),
              _articleWidget()
            ],
          )),
        ]));
  }

  Widget _sliderComponent() {
    var option = CarouselOptions(height: Get.height / 100 * 25);

    return Container(
        alignment: Alignment.center,
        child: CarouselSlider(
          options: option,
          items: controller.getEmissions().map((i) => Builder(
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  image: DecorationImage(image: AssetImage('assets/${i['image']}'))
                ),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                )
              )
            )
          ).toList(),
        )).marginOnly(top: 5).centered();
  }

  Widget _radioWidget() {
    return VStack(
      [
        VxCircle(
          child: Obx(() => Icon(
                radioController.played.value
                    ? Icons.play_arrow_outlined
                    : Icons.pause_outlined,
                size: 50,
                color: Colors.white,
              )),
          backgroundColor: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[400], Colors.blue[900]],
          ),
        ).h15(Get.context).click(() => radioController.playPause()).make(),
        "106.8".text.color(Colors.white).size(25).make()
      ],
      alignment: MainAxisAlignment.center,
      crossAlignment: CrossAxisAlignment.center,
    )
        .h(Get.height / 10 * 3)
        .glassMorphic(
            width: Get.width,
            height: Get.height / 10 * 3,
            blur: 20,
            borderRadius: BorderRadius.circular(0))
        .backgroundColor(Colors.blue[700])
        .w(Get.width);
  }

  Widget _articleWidget() {
    var articleDelegate = controller.articles.map((article) {
      return ListTile(
        title: "Titre de l'article #$article".text.color(Colors.black).make(),
        subtitle: "description de l'article en suspend..."
            .text
            .color(Colors.black)
            .make(),
      );
    }).toList();

    return VStack([
      "Actualités"
          .text
          .size(20)
          .color(Colors.black)
          .make()
          .pOnly(left: 10, top: 15),
      ...articleDelegate
    ]);
  }
}
