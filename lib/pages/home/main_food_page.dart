import 'package:flutter/material.dart';
import 'package:food_app/widgets/big_text.dart';

import '../../Utils/color.dart';
import '../../Utils/dimensions.dart';
import '../../widgets/small_text.dart';
import 'food_page_body.dart';
// Height is 897
// Width is 423

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}
class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing the container
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45,
                  bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India",color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Pratapgarh",color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius15)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing the body
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              child: FoodPageBody(),
            ),
          ),

        ],
      ),
    );
  }
}
