import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("temp", style: TextStyle(
                      color:Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w300
                    ),),
                    Text("weather", style: TextStyle(
                      color: Colors.black12,
                      fontSize: 13,
                      fontWeight: FontWeight.w800
                    ),)
                  ],
                ),
                const SizedBox(height: 12,),
                Text("data", style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),),
                const SizedBox(height: 12,),
                Text("time_in the_city")
              ],
            ),
            Image(
                image: AssetImage(""), 
                width: 20, height: 20, 
                fit: BoxFit.fill,
            alignment: Alignment.centerRight,)
          ],
        ),
      ),
    );
  }
}
