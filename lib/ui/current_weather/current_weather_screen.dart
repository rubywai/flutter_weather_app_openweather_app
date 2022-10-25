import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/current_weather/current_weather_bloc.dart';
import 'package:untitled/data/model/current_weather_model.dart';

import '../../cost/api_const.dart';

class CurrentWeather extends StatefulWidget {
   const CurrentWeather({Key? key,required this.lat,required this.long}) : super(key: key);
   final double lat;
   final double long;
  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  final CurrentWeatherBloc _currentWeatherBloc = CurrentWeatherBloc();
  @override
  void initState() {
    super.initState();
    _currentWeatherBloc.add(GetCurrentWeather(widget.lat, widget.long));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentWeatherBloc>(
      create: (context) => _currentWeatherBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Application'),
          centerTitle: true,
        ),
        body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
          builder: (context, state) {
            if(state is CurrentWeatherLoading){
              return const Center(child: CircularProgressIndicator());
            }
            else if(state is CurrentWeatherFailed){
              return const Center(child: Text('Something wrong'),);
            }
            else if(state is CurrentWeatherSuccess){
              CurrentWeatherModel detail = state.currentWeatherModel;
              return Center(
                child: Container(
                  decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xff5C6BC0),
                            Color(0xff3949AB),
                            Color(0xff283593)
                          ]
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(detail.name ?? "",style: const TextStyle(color: Colors.white)),
                      ),
                      const Divider(),
                      const Text("Max Temp:",style: TextStyle(color: Colors.white)),
                      Text(detail.main!.tempMax.toString(),style: const TextStyle(color: Colors.white)),
                      const Divider(),
                      const Text("Min Temp:",style: TextStyle(color: Colors.white)),
                      Text(detail.main!.tempMin.toString(),style: const TextStyle(color: Colors.white)),
                      const Divider(),
                      const Text("Current Temp:",style: TextStyle(color: Colors.white)),
                      Text(detail.main!.temp.toString(),style: const TextStyle(color: Colors.white,fontSize: 25)),
                      const Divider(),
                      Image.network('http://openweathermap.org/img/wn/${detail.weather?[0].icon}@2x.png'),
                      const Divider(),
                      Text(detail.weather![0].main!,style: const TextStyle(color: Colors.white,fontSize: 25)),




                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
           
          },
        ),
      ),
    );
  }
}
