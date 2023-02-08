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
    @State var dataPoints: [Double] = [2, 3, 5, 5, 4, 4, 2, 10]
    
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
            Spacer()
            
            Group {
                Text("Standard Deviation")
                Text("\(standardDeviation)")
            }
            
            Spacer()
            
            Group {
                Text("95% Confidence Interval (2SE Bars)")
                Text("\(standardErrorBars)")
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
