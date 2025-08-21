import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/main_page_cubit.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_icons/weather_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var tfController1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Hava Durumu",style: TextStyle(fontSize: 25,color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: tfController1,
                decoration: InputDecoration(
                    labelText: "Şehir Adı : ",
                    labelStyle: TextStyle(color: Colors.blueGrey),
                    hintText: "Şehir Ara :",
                    prefixIcon: Icon(Icons.location_city,color: Colors.blueGrey,),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    )

                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    textStyle: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold)
                  ),
                  onPressed: (){
                    context.read<MainPageCubit>().getWeather(tfController1.text);
                  },
                  child: Text("ARA")
              ),
              const SizedBox(height: 30),
              BlocBuilder<MainPageCubit,WeatherState>(
                builder: (context,state) {
                  if (state is WeatherLoading) return CircularProgressIndicator();
                  if (state is WeatherLoaded) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      color: Colors.white.withOpacity(0.85),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(state.weather.cityName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('${state.weather.temp} °C', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(state.weather.description, style: TextStyle(fontSize: 18)),
                            const SizedBox(height: 15),
                            Icon(WeatherIcons.cloud),
                          ],
                        ),
                      ),
                    );
                  }
                 if (state is WeatherError) return Text(state.message);
                 return Container();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
