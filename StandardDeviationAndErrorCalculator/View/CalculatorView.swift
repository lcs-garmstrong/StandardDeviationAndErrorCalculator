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
    
    // parts of equation
    var total = 0
    
    //MARK: Computed properties
    // To add all given data points together to find mean and number of samples.
    
//    for point in dataPoints {
//        total = total + point
//    }
//
//    var mean: Int {
//        return total / dataPoints.count
//    }
    
    var standardDeviation:
    
    
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
