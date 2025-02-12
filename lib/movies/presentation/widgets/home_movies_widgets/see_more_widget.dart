import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/app_styles.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({super.key, required this.title,required this.onTap});
final String title;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,24,16,8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Text(title,style:Styles.styleMedium20(context), ),
       InkWell(
        onTap:onTap ,
         child: Row(
          children: [
            Text(AppConstants.seeMore,style: Styles.styleRegular16(context)),
            const SizedBox(width: 5,),
            const Icon(Icons.arrow_forward_ios,size: 16,)
          ],
         ),
       )
        ],
      ),
    );
  }
}