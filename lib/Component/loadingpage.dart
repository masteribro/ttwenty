import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../Constant/color.dart';

class LoadingButton extends StatefulWidget {
  String label;
  Function() onPressed;
  bool? isLoading;
  bool? disabled;
  LoadingButton({Key? key, required this.isLoading, this.disabled, required this.label, required this.onPressed}) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (widget.isLoading == true) ? () {} : widget.onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        backgroundColor: MaterialStateProperty.all(AppColor.grey1.disable(widget.disabled == true)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
      ),
      child: (widget.isLoading == true)
          ? const SpinKitSpinningLines(
        color: AppColor.white,
        size: 35.0,
      )
          : Text(widget.label),
    );
  }
}
