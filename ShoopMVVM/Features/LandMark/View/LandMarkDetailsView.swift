//
//  LandMarkDetailsView.swift
//  ShoopMVVM
//
//  Created by SH EG on 10/07/2022.
//

import SwiftUI
import MapKit

struct LandMarkDetailsView: View {
    var landmark:Landmark
    @State private var region = MKCoordinateRegion()
       
    var body: some View {
        ScrollView{
            
        
        VStack(alignment: .center){
            ZStack{
                Map(coordinateRegion:$region).frame( height:300).ignoresSafeArea().onAppear {
                    region = MKCoordinateRegion(
                        center: landmark.locationCoordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                    )
                }
                
                Image(landmark.imageName).resizable().frame(width: 200, height: 200,alignment: .center).aspectRatio(contentMode: .fill).clipShape(Circle()).overlay{
                    Circle().stroke(.white, lineWidth: 4)
                }.shadow( radius: 7 ).offset( y: 130)
            }.padding(.bottom, 60)
           
           
            
            VStack(alignment: .leading){
                Text(landmark.name)
                                   .font(.title)

                               HStack {
                                   Text(landmark.park)
                                   Spacer()
                                   Text(landmark.state)
                               }
                               .font(.subheadline)
                               .foregroundColor(.secondary)

            Divider()
            
                VStack(alignment: .leading){
                Text("About \(landmark.name)")
                                    .font(.title2)
                    Text(landmark.description)
            }
            }.padding()
        }
            
        }.ignoresSafeArea().navigationTitle(landmark.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct LandMarkDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkDetailsView(landmark: landmarks[0])
    }
}
