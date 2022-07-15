//
//  LandmarkRowView.swift
//  ShoopMVVM
//
//  Created by SH EG on 10/07/2022.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark:Landmark
    var body: some View {
        HStack{
            Image(landmark.imageName).resizable().frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName:"star.fill").foregroundColor(.yellow)
            }
        }
        
        
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRowView(landmark: landmarks[0])
    }
}
