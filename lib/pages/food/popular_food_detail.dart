import 'package:flutter/material.dart';
import 'package:food_app/Utils/app_constants.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import 'package:food_app/pages/home/main_food_page.dart';
import '../../Utils/color.dart';
import '../../Utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    // print("page id is "+pageId.toString());
    // print("product name is "+product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //BackGround Image
          Positioned(
            left:  0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                  )
                  // image: AssetImage(
                  //   "assets/images/green1.png"
                  // )
                )
              ),

            ),
          ),
          // Icon Widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               GestureDetector(
                 onTap:(){
                   Get.to(()=>MainFoodPage());
                  },
                 child: AppIcon(
                   icon: Icons.arrow_back_ios,
                 ),
               ),
               AppIcon(
                 icon: Icons.shopping_cart_outlined,
               )
             ],
            ),
          ),
          // Introduction of Food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-Dimensions.height20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft : Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!,),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text:product.description!),
                    ),
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),

      //Cart Add On
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct){
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height28,
                bottom: Dimensions.height28,
                left: Dimensions.width20,
                right: Dimensions.width20
            ),
            decoration:BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2)
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Dimensions.height30*3,
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(Icons.remove, color: AppColors.signColor,)
                      ),
                      SizedBox(width: Dimensions.width10),
                      BigText(text: popularProduct.quantity.toString()),
                      SizedBox(width: Dimensions.width10),
                      GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor,)
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  child: BigText(text: "\$ ${product.price!} | Add to Cart",color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
