//
//  LandMarkListView.swift
//  ShoopMVVM
//
//  Created by SH EG on 10/07/2022.
//

import SwiftUI
import Combine
struct LandMarkListView: View {
    @State private var showFavoritesOnly:Bool = false
    var publisher = PassthroughSubject<Int,Never>()
    
    var body: some View {
        NavigationView{
            VStack{
                
                List{
                    
                    Toggle("Favorites only", isOn: $showFavoritesOnly)
                    ForEach(landmarks){ landmark in
                        if (!showFavoritesOnly || landmark.isFavorite ){
                            NavigationLink {
                                LandMarkDetailsView(landmark: landmark)
                            } label: {
                                LandmarkRowView(landmark: landmark).ignoresSafeArea()
                            }
                        }
                    }
                    
                    
                }
            }
            
           
        }.navigationTitle("Landmarks").navigationBarTitleDisplayMode(.inline)
        
       
        
    }
}

struct LandMarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkListView()
            .preferredColorScheme(.light)
    }
}
