import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
<<<<<<< HEAD
import 'package:goshop/modules/checkout/checkout_screen.dart';
=======
>>>>>>> 5da8107dcaa0857534137476e44206c4cabbb5d5
import 'package:goshop/modules/productScreen.dart';
import 'package:goshop/modules/zoom_drawer.dart';
import '../cubit/shopCubit.dart';
import '../cubit/states.dart';
import '../models/cartModels/cartModel.dart';
import '../shared/constants.dart';
import 'SearchScreen.dart';

class CartScreen extends StatelessWidget {
  bool showBottomSheet = true;
  TextEditingController counterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CartModel cartModel = ShopCubit.get(context).cartModel;
        cartLength = ShopCubit.get(context).cartModel.data!.cartItems.length;
        return Scaffold(
          bottomSheet: cartLength != 0
              ? InkWell(
<<<<<<< HEAD
                  onTap: () {
                    navigateTo(context, CheckoutScreen());
                  },
=======
                  onTap: () {},
>>>>>>> 5da8107dcaa0857534137476e44206c4cabbb5d5
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      'Check Out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          color: Colors.deepPurple,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white),
                              onPressed: () {
                                ZoomDrawer.of(context)!.toggle();
                              },
                            ),
                            const Text(
                              'Cart',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.home_outlined,
                                  color: Colors.white),
                              onPressed: () {
                                navigateAndKill(context, ZDrawer());
                                ShopCubit.get(context).currentIndex = 0;
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.05,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      SearchScreen(
                                        ShopCubit.get(context),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.deepPurple,
                                  ),
                                  label: const Text(
                                    'Type a product name',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
<<<<<<< HEAD
                                        content: Text('Coming soon ...'),
=======
                                        content: Text('Comming soon ...'),
>>>>>>> 5da8107dcaa0857534137476e44206c4cabbb5d5
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.filter_alt_outlined,
                                    color: Colors.deepPurple,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                cartLength != 0
                    ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Product :' ,
                                      style: TextStyle(color: Colors.grey)),
                                  Text('($cartLength Items)',
                                      style: TextStyle(color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Subtotal EGP :',
                                      style: TextStyle(color: Colors.grey)),
                                  Text('${cartModel.data!.subTotal}',
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: cartProducts(
                                  ShopCubit.get(context)
                                      .cartModel
                                      .data!
                                      .cartItems[index],
                                  context),
                            ),
                            separatorBuilder: (context, index) => SizedBox(),
                            itemCount: cartLength,
                        ),
                      ],
                    )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 70,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Your Cart is empty',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'Be Sure to fill your cart with something you like',
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cartProducts(CartItems? model, context) {
    counterController.text = '${model!.quantity}';
    return InkWell(
      onTap: () {
        ShopCubit.get(context).getProductData(model.product!.id);
        navigateTo(context, ProductScreen());
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.99,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(model.product!.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.022,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.027,
                              ),
                              Text(
                                model.product!.name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                'EGP ' + '${model.product!.price}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.deepPurple,
                  child: IconButton(
              onPressed: () {
                ShopCubit.get(context).addToCart(model.product!.id);
              },
              icon: Icon(
                  Icons.close,
                  color: Colors.white,
                size: 15,
              ),
            ),
                )),
            Positioned(
              bottom: 21.2,
              right: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.27,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        Icons.add,
                        color: Colors.amber[700],
                      ),
                      onPressed: () {
                        int quantity = model.quantity! + 1;
                        if (quantity <= 5)
                          ShopCubit.get(context)
                              .updateCartData(model.id, quantity);
                      },
                    ),
                    Text(
                      '${model.quantity}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      splashRadius: 20,
                      color: Colors.amber[700],
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        int quantity = model.quantity! - 1;
                        if (quantity != 0)
                          ShopCubit.get(context)
                              .updateCartData(model.id, quantity);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
<<<<<<< HEAD
=======
    // child: Container(
    //   height: 180,
    //   padding: EdgeInsets.all(15),
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 100,
    //         child: Row(
    //           children: [
    //             Image(
    //               image: NetworkImage('${model.product!.image}'),
    //               width: 100,
    //               height: 100,
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Expanded(
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     '${model.product!.name}',
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                     ),
    //                     maxLines: 3,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                   Spacer(),
    //                   Text(
    //                     'EGP ' + '${model.product!.price}',
    //                     style: TextStyle(
    //                         fontSize: 20, fontWeight: FontWeight.bold),
    //                   ),
    //                   if (model.product!.discount != 0)
    //                     Text(
    //                       'EGP' + '${model.product!.oldPrice}',
    //                       style: TextStyle(
    //                           decoration: TextDecoration.lineThrough,
    //                           color: Colors.grey),
    //                     ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       Spacer(),
    //       Row(
    //         children: [
    //           Container(
    //             width: 20,
    //             height: 20,
    //             child: MaterialButton(

    //               child: Icon(
    //                 Icons.remove,
    //                 size: 17,
    //                 color: Colors.deepOrange,
    //               ),
    //               minWidth: 20,
    //               //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //               padding: EdgeInsets.zero,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 5,
    //           ),
    //           Text(
    //             '${model.quantity}',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           SizedBox(
    //             width: 5,
    //           ),
    //           Container(
    //             width: 20,
    //             height: 20,
    //             child: MaterialButton(

    //               child: Icon(
    //                 Icons.add,
    //                 size: 17,
    //                 color: Colors.green[500],
    //               ),
    //               minWidth: 10,
    //               //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //               padding: EdgeInsets.zero,
    //             ),
    //           ),
    //           Spacer(),
    //           TextButton(
    //             onPressed: () {
    //               ShopCubit.get(context).addToCart(model.product!.id);
    //               ShopCubit.get(context).changeToFavorite(model.product!.id);
    //             },
    //             child: Row(
    //               children: [
    //                 Icon(
    //                   Icons.favorite_border_rounded,
    //                   color: Colors.grey,
    //                   size: 18,
    //                 ),
    //                 SizedBox(
    //                   width: 2.5,
    //                 ),
    //                 Text(
    //                   'Move to Wishlist',
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                     fontSize: 13,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             width: 5,
    //           ),
    //           Container(
    //             height: 20,
    //             width: 1,
    //             color: Colors.grey[300],
    //           ),
    //           TextButton(
    //               onPressed: () {
    //                 ShopCubit.get(context).addToCart(model.product!.id);
    //               },
    //               child: Row(
    //                 children: [
    //                   Icon(
    //                     Icons.delete_outline_outlined,
    //                     color: Colors.grey,
    //                     size: 18,
    //                   ),
    //                   SizedBox(
    //                     width: 2.5,
    //                   ),
    //                   Text('Remove',
    //                       style: TextStyle(
    //                         color: Colors.grey,
    //                         fontSize: 13,
    //                       )),
    //                 ],
    //               )),
    //         ],
    //       )
    //     ],
    //   ),
    // ),
>>>>>>> 5da8107dcaa0857534137476e44206c4cabbb5d5
  }
}
