//
//  STextField.swift
//  ShoopMVVM
//
//  Created by SH EG on 14/07/2022.
//

import SwiftUI
struct STextFieldModel{
     var text :String
     var errorMessage :String?
     var placeHolder:String
     var showError:Bool = false
     
}
struct STextField: View {
    @Binding var sTextFieldModel :STextFieldModel
    var body: some View {
        VStack(alignment: .trailing){
        ZStack{
            TextField($sTextFieldModel.placeHolder.wrappedValue, text: $sTextFieldModel.text).padding(16)
                .overlay(RoundedRectangle(cornerRadius: 100)
                    .stroke(sTextFieldModel.showError ? .gray.opacity(0.3) : .red , lineWidth: 2))
            
            if(sTextFieldModel.showError){
                HStack{
                    Spacer()
                    Button {
                        sTextFieldModel.text = ""
                    } label: {
                        Image("circle closed red")
                    }.padding()
                }
            }

        }
        
            if(sTextFieldModel.showError ){
            VStack(alignment: .trailing, spacing: 0){
                Image("textfield_arrow_error").padding(.trailing,16)
                HStack(alignment: .center){
                    Image("Warning icon white").padding(4)
                    
                    Text($sTextFieldModel.errorMessage.wrappedValue ?? "").fontWeight(.medium).font(.custom("Poppins", size: 24)).foregroundColor(Color.white).padding(2)
                    
                }.background(.red).cornerRadius(4)
            }
            
            }
            
            
        }
        
    }
}

struct STextField_Previews: PreviewProvider {

    @State static  var sTextFieldModel :STextFieldModel =  STextFieldModel(text: "", errorMessage: nil, placeHolder: "enter")

    static var previews: some View {
        
        STextField(sTextFieldModel: $sTextFieldModel)
    }
}
