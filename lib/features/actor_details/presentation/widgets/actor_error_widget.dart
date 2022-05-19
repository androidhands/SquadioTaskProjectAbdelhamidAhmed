import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActorDetailsErrorWidget extends StatelessWidget{
  final String? message;


  const ActorDetailsErrorWidget({Key? key,required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(
        children: [
          Text(message!,style: GoogleFonts.reemKufi(fontSize: 16),),
          MaterialButton(onPressed: (){

          },
          child:  Text('Try Again',style: GoogleFonts.reemKufi(fontSize: 12),),
          color: Colors.orange,)
        ],
      ),
    );
  }

}