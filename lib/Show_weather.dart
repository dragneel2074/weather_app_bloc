import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';

import 'Weather_Model.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel weather;
  final String city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
   
        return Container(
            padding: EdgeInsets.only(right: 32, left: 32, top: 10),
            child: Column(
              children: <Widget>[
                Text(
                  city,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  weather.temp.toString() + "K",
                  style: TextStyle(color: Colors.white70, fontSize: 50),
                ),
                Text(
                  "Temprature",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          // weather.tempMin.toString() + "K"
                         '284.15 K' ,
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Min Temprature",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                         // weather.tempMax.toString() + "K"
                         '293.15 K' ,
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Max Temprature",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.lightBlue,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                )
              ],
            ));
      
    
  }
}
