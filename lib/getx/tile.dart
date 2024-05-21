import 'package:flutter/material.dart';
import 'package:flutter_widget/getx/model.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final Result product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Container(
                //   height: 150,
                //   width: double.infinity,
                //   clipBehavior: Clip.antiAlias,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //   ),
                //   child: Image.network(
                //     product.imgs?[0].imgpath.toString() ?? "",
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: product.products?[0].isFavorite ?? false
                              ? const Icon(Icons.favorite_rounded)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                           // product.isFavorite.toggle();
                          },
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name.toString(),
              maxLines: 2,
              style:
                  const TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            // if (product.rating != null)
            //   Container(
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           product.rating.toString(),
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         Icon(
            //           Icons.star,
            //           size: 16,
            //           color: Colors.white,
            //         ),
            //       ],
            //     ),
            //   ),
            const SizedBox(height: 8),
            Text('\$${product.products![0].description}',
                style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}
