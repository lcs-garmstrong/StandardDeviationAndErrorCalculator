//
//  CalculatorView.swift
//  StandardDeviationAndErrorCalculator
//
//  Created by Graeme Armstrong on 2023-02-07.
//

import SwiftUI

struct CalculatorView: View {
    //MARK: Stored properties
    
    // list of points
    @State var dataPoints: [Double] = []
    
    
    //MARK: Computed properties
    
    var body: some View {
        VStack{
            HStack{
                Text("TextField")
                Spacer()
            }
            HStack {
                Text("Data Points")
                
                Spacer()
                
                VStack(spacing: 20){
                    
                    Text("Button")
                    Text("Button")
                    Text("Button")
                    
                }
            }
        }
        .padding()
        .navigationTitle("Standard Deviation Calculator")
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalculatorView()
        }
    }
}
