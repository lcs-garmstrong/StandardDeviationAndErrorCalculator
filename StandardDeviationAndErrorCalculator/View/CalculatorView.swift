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
    @State var number: Double = 0
    @State var dataPoints: [Double] = []
    
    //MARK: Computed properties
    // To add all given data points together to find mean and number of samples.
    var mean: Double {
        // parts of equation
        var total = 0.0
        
        for point in dataPoints {
            total = total + point
        }
        
        return total / Double(dataPoints.count)
    }
    
    // calculating SD
    var standardDeviation: Double {
        
        var sumOfPoints = 0.0
        
        for eachPoint in dataPoints {
            sumOfPoints = sumOfPoints + (eachPoint - mean) * (eachPoint - mean)
        }
        
        return (sumOfPoints / Double(dataPoints.count)).squareRoot()
    }
    
    // Equation to calculate 2SE bars or 95% confidence Interval
    var standardErrorBars: Double {
        return (standardDeviation / (Double(dataPoints.count).squareRoot())) * 2
    }
    
    var body: some View {
        VStack{
            
            Group {
                Text("TextField")
                Slider(value: $number,
                       in: 1...100,
                       step: 0.5,
                       label: {Text("Number")})
                
                Text("\(number)")
            }
            
            Spacer()
            
            HStack {
                Text("Data Points")
                
                Spacer()
                
                VStack(spacing: 20){
                    
                    Button(action: {
                        dataPoints.append(number)
                    }, label: {
                        Text("Add Number")
                    })
                    .buttonStyle(.bordered)
                    
                    
                }
            }
            
            Spacer()
            
            Group {
                    Text("Mean")
                    Text("\(mean)")
                
                    Text("Standard Deviation")
                    Text("\(standardDeviation)")

                
                    Text("95% Confidence Intervals Bars")
                    Text("\(standardErrorBars)")
            }
            
        }
        .padding()
        .navigationTitle("SD and SE Bars Calculator")
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalculatorView()
        }
    }
}
