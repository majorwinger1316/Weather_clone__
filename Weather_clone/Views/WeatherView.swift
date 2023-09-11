//
//  HomeView.swift
//  Weather_clone
//
//  Created by Akshat Dutt Kaushik on 12/09/23.
//

import SwiftUI
import SwiftUI
import Foundation



struct WeatherView: View {
    var weather: ResponseBody

    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0){
                    CityNameView(cityname: weather.name)
                    TempView(temperature: weather.main.temp.roundDouble())
                    SkyView(SeeSky: weather.weather[0].main)
                    CoorView(High: weather.main.temp_max.roundDouble(), Low: weather.main.tempMin.roundDouble())
                    
                    Spacer()
                    HStack(spacing: 16){
                        
                        WholeView(Option: "P", imagename: "wind", Num: weather.main.pressure.roundDouble() + " hpa")
                        WholeView(Option: "H", imagename: "humidity", Num: weather.main.humidity.roundDouble() + " g/kg")
                        
                    }.padding().border(Color.white, width: 0)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16.0))
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: SelectionView(), label: {
                        Text("Change Location")
                            .font(.system(size: 20, design: .default))
                            .foregroundColor(.white)
                            .padding().border(Color.white, width: 0)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16.0))
                    })
                    Spacer()
                }
            }
        }
    }
    

    
    
    
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }
    
    struct WholeView: View {
        var Option : String
        var imagename : String
        var Num : String
        
        var body: some View {
            VStack(spacing: 6){
                Text("**\(Option)**")
                    .font(.system(size: 28, design: .default))
                    .foregroundColor(.white)
                Image(systemName: imagename)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34)
                    .foregroundColor(.white)
                Text("**\(Num)**")
                    .font(.system(size: 28, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
    
    struct CityNameView: View{
        var cityname : String
        var body: some View{
            Text(cityname)
                .font(.system(size: 32, design: .default))
                .foregroundColor(.cyan)
                .padding()
        }
    }
    
    struct TempView: View{
        var temperature : String
        var body: some View{
            Text("\(temperature)°C")
                .font(.system(size: 100, design: .default) )
                .foregroundColor(.cyan)
        }
    }
    
    struct SkyView: View{
        var SeeSky : String
        var body: some View{
            Text(SeeSky)
                .font(.system(size: 28, design: .default))
                .foregroundColor(.cyan)
        }
    }
    
    struct CoorView: View{
        var High : String
        var Low : String
        var body: some View{
            HStack{
                Text("H:\(High)°C")
                    .font(.system(size: 28, design: .default))
                    .foregroundColor(.cyan)
                Text("L:\(Low)°C")
                    .font(.system(size: 28, design: .default))
                    .foregroundColor(.cyan)
            }
        }
    }
    
    
}
