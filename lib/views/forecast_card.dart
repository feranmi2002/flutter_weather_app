import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: 20,
        height: 45,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "time",
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w900,
                    fontSize: 13),
              ),
              SizedBox(height: 4),
              Text(
                "day",
                style: TextStyle(color: Colors.black12, fontSize: 13),
              ),
              SizedBox(height: 8),
              Image(
                image: AssetImage(""),
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8),
              Text("data", style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
