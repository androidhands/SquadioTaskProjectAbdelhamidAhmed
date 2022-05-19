import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDetailItem extends StatelessWidget{
  final String? detailKey;
  final String? detailValue;

  const SingleDetailItem({Key? key,required this.detailKey,required this.detailValue}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$detailKey:\n',
        style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: detailValue!,
            style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal),

          )
        ]
    )
    );
  }

}