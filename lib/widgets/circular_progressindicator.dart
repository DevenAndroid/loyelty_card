import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_colour.dart';
import '../resourses/size.dart';


class CommonProgressIndicator extends StatelessWidget {
  const CommonProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Platform.isAndroid ? const CircularProgressIndicator(color: AppTheme.secondaryColor,):
        CupertinoActivityIndicator(color: AppTheme.secondaryColor,radius: AddSize.size20, )
    );
  }
}
