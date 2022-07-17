import 'package:facebook/icons/custom_icons.dart';
import 'package:flutter/material.dart';

import 'quick_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    -se puede usar un ListView asignandole un SizedBox para q sepa q tamaño tomar
    -se puede usar fittedBox esto lo va a escarlar a un tamaño menor y usar el 
     fot: boxfit.scaledown para solo escalar hacia abajo(en caso de un ipad)
     y para que no queden centrado en una tablet le podemos pasar aligment.centerleft
    */
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      
      spacing: 10,
      runSpacing: 15,
      children: const [
        QuickButton(
            iconData: CustomIcons.photos,
            text: 'Gallery',
            color: Color.fromARGB(255, 90, 204, 149)),
        
        QuickButton(
            iconData: CustomIcons.userFriends,
            text: 'Tag Friends',
            color: Color.fromARGB(255, 110, 170, 240)),
        
        QuickButton(
            iconData: CustomIcons.videoCamera,
            text: 'Live',
            color: Color.fromARGB(255, 204, 90, 90)),
        
      ],
    );
  }
}
