//
//  ContentView.swift
//  imcApp
//
//  Created by Victor Brigido on 10/06/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var weight: String = ""
    @State private var heigth: String = ""
    @State private var imc: String = ""
    

    
    var body: some View {
        
        VStack {
            Text("Calcule seu IMC")
                .font(.title)
            TextField("Digite seu peso", text: $weight)
                .keyboardType(.decimalPad)
                .padding()
            TextField("Digite sua altura em cm", text: $heigth)
                .keyboardType(.decimalPad)
                .padding()
            
            
            VStack {
                Text(imc)
            }
            
            Button {
                calculateIMC()
            } label: {
                VStack {
                    Text("Calcular")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                .frame(maxWidth: 200, maxHeight: 50)
                .background(.blue)
                .cornerRadius(8.0)
                .padding(.top)          
            }
            
        }
        .padding()
    }
    
    func calculateIMC() {
        guard let weight = Double(weight),
              let height = Double(heigth) else {
            imc = "valores Inválidos"
            
            weight = ""
            heigth = ""
           
            return
            
        }
        
        
        let imcValue = weight / (height/100 * height/100)
        imc = String(format: "Seu IMC é %.2f", imcValue)
    }
}

#Preview {
    ContentView()
}
