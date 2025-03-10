import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget{
  const AnimationLoaderWidget ({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: 20,),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xfffffff),
              fontSize: 25
            ),
          )
        ],
      ),
    );
  }

}