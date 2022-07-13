//
//  LoginView.swift
//  ShoopMVVM
//
//  Created by SH EG on 09/07/2022.
//

import SwiftUI
import MapKit
struct LoginView: View {

    var body: some View {
//        HStack {
//
//            Text("Hello, World!").aspectRatio(contentMode: .fit)
//                .foregroundColor(Color.black)
//            Text("Hello, World!")
//                .foregroundColor(Color.black)
//        }
        
//        ZStack{
//            Image("background")
//            VStack{
//                Spacer()
//                Image("logo")
//                Spacer()
//                HStack{
//                    Spacer()
//                    Image("card2")
//                    Spacer()
//                    Image("card3")
//                    Spacer()
//                }
//
//                Spacer()
//                Image("dealbutton")
//                Spacer()
//                HStack{
//                    Spacer()
//                    VStack(spacing: 10.0){
//                    Text("Player")
//                        .font(.headline)
//                        .foregroundColor(Color.white)
//                    Text("0").font(.largeTitle).foregroundColor(.white)
//                }
//                    Spacer()
//                    VStack(spacing: 10.0){
//                    Text("Cpu").font(.headline).foregroundColor(.white)
//                    Text("0").font(.largeTitle).foregroundColor(.white)
//                }
//                    Spacer()
//
//
//                }
//                Spacer()
//
//            }
//        }
        
        
       
        
//        VStack(alignment: .center){
//            ZStack{
//                Map(coordinateRegion: $region).frame( height:300).ignoresSafeArea()
//
//                Image("logo").resizable().frame(width: 200, height: 200,alignment: .center).aspectRatio(contentMode: .fill).clipShape(Circle()).overlay{
//                    Circle().stroke(.white, lineWidth: 4)
//                }.shadow( radius: 7 ).offset( y: 130)
//            }.ignoresSafeArea().padding(.bottom, 60)
//
//
//
//            VStack(alignment: .leading){
//                Text("Turtle Rock")
//                                   .font(.title)
//
//                               HStack {
//                                   Text("Joshua Tree National Park")
//                                   Spacer()
//                                   Text("California")
//                               }
//                               .font(.subheadline)
//                               .foregroundColor(.secondary)
//
//            Divider()
//
//                VStack(alignment: .leading){
//                Text("About Turtle Rock")
//                                    .font(.title2)
//                                Text("Descriptive text goes here.")
//            }
//            }.padding()
//            Spacer()
//
//        }
        
        
      LandMarkListView()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
