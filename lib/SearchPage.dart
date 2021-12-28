import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';

import 'Show_weather.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();
    final String imgSrc = "https://www.amnh.org/var/ezflow_site/storage/images/media/amnh/images/explore/ology-images/earth/what-s-the-big-idea-about-earth/earth-icon/4690373-1-eng-US/earth-icon.png";
    return SafeArea(child: SingleChildScrollView(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsNotSearched) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                    child: Image.network(imgSrc),
                    height: 300,
                    width: 300,
                  )),
                  Container(
                      padding: EdgeInsets.only(
                        left: 32,
                        right: 32,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Search Weather",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70),
                          ),
                          Text(
                            "Instanly",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w200,
                                color: Colors.white70),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: cityController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.white70,
                                      style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid)),
                              hintText: "City Name",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () {
                                weatherBloc
                                    .add(FetchWeather(cityController.text));
                              },
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      )),
                ]);
          } else if (state is WeatherIsLoading)
            return Center(child: CircularProgressIndicator());
          else if (state is WeatherIsLoaded)
            return ShowWeather(state.getWeather, cityController.text);
          else
            return Text(
              "Error",
              style: TextStyle(color: Colors.white),
            );
        },
      ),
    ));
  }
}
