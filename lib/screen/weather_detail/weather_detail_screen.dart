import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/weather_detail/weather_detail_bloc.dart';
import 'package:untitled/cost/icon_const.dart';
import 'package:untitled/data/model/current_weather_model.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({Key? key,required this.lat,required this.lon}) : super(key: key);
  final double lat;
  final double lon;

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  final WeatherDetailBloc _weatherDetailBloc = WeatherDetailBloc();
  @override
  void initState() {
    super.initState();
    _weatherDetailBloc.add(WeatherDetail( widget.lat, widget.lon));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _weatherDetailBloc,
      child: Scaffold(
        appBar: AppBar(elevation: 0,backgroundColor: Color(0xff283593),),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
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
          child: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(
            builder: (context, state) {
              if(state is WeatherDetailLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state is WeatherDetailSuccess){
                CurrentWeatherModel currentWeatherModel = state.currentWeatherModel;
                Weather weather = currentWeatherModel.weather![0];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(currentWeatherModel.name ?? '',style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    timeWidget(currentWeatherModel.dt ?? 0),
                    tempWidget(currentWeatherModel,weather),
                    Text(weather.main ?? '',style: const TextStyle(fontSize: 30,color: Colors.white),)

                  ],
                );
              }
              else if(state is WeatherDetailFail){
                return Center(child: Text(state.errorMessage),);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
  Widget timeWidget(int time){
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(time * 1000);
    return Text('Updated : ${dateTime.hour} : ${dateTime.minute}',
    style: const TextStyle(fontSize: 25,color: Colors.white ),);
  }
  Widget tempWidget(CurrentWeatherModel currentWeatherModel,Weather weather){
    return SizedBox(
      height: 200,
      child: Row(
        children: [
           Expanded(
             child: CachedNetworkImage(
                 imageUrl: iconLink(weather.icon ?? '')),
           ),
          Expanded(child: Text('${currentWeatherModel.main?.temp} ° ',
          style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)) ,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Max : ${currentWeatherModel.main?.tempMax}',
                style: const TextStyle(color: Colors.white),),
                Text('Min : ${currentWeatherModel.main?.tempMin}',
                style: const TextStyle(color: Colors.white),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
