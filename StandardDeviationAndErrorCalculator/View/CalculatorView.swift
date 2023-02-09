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
    @State var number: String = ""
    @State var dataPoints: [Double] = []
    
    //MARK: Computed properties
    
    // changing input into an optional double
    var numberAsOptionalDouble: Double? {
        guard let inputGivenAsDouble = Double(number) else {
            return nil
        }
        return inputGivenAsDouble
    }
    
    // making input Double 
    var numberAsDouble: Double {
        guard let valueAsDouble = numberAsOptionalDouble else {
            return 0
        }
        return valueAsDouble
    }
    
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
                
            }
            
            Spacer()
            
            HStack {
                VStack{
                    
                    TextField("5.0", text: $number)
                    
                    Text("\(numberAsDouble.formatted(.number.precision(.fractionLength(2))))")
                }
                
                VStack(spacing: 20){
                    
                    // Button to add number to array dataPoints
                    Button(action: {
                        dataPoints.append(numberAsDouble)
                    }, label: {
                        Text("Add Number")
                    })
                    .buttonStyle(.bordered)
                    
                    // button to reset numbers in dataPoints
                    Button(action: {
                        dataPoints.removeAll()
                    }, label: {
                        Text("Reset")
                    })
                    .buttonStyle(.bordered)
                    
                }
            }
            
            Text("Data Points:")
                .font(.title2)
            // List to show what numbers are in dataPoints array.
            List(dataPoints, id: \.self) { currentDataPoint in
                Text("\(currentDataPoint.formatted(.number.precision(.fractionLength(2))))")
            }
            
            Group {
                Text("Mean")
                    .bold()
                Text("\(mean)")
                
                Text("Standard Deviation")
                    .bold()
                Text("\(standardDeviation)")
                
                Text("95% Confidence Intervals Bars")
                    .bold()
                Text("\(standardErrorBars)")
            }
            .font(.title3)
        }
        .padding()
        .navigationTitle("SD / SE Calculator")
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalculatorView()
        }
    }
}
