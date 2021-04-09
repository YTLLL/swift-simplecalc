print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    
    if args.count == 1 {
        return 0
    }
    switch args.last {
    case "count":
        return args.count - 1
    case "avg":
        var sum = 0
        for i in 0..<(args.count){
            sum += (Int(args[i]) ?? 0)
        }
        return sum / (args.count - 1)
    case "fact":
        if Int(args[0]) == 0 {
            return 1
        } else {
            var x = 1
            for i in 1...(Int(args[0]) ?? 0) {
                x *= i
            }
            return x
        }
    default:
        let first : Int! = Int(args[0])
        let second : Int! = Int(args[2])
        switch args[1] {
        case "+": return first + second
        case "-": return first - second
        case "*": return first * second
        case "/": return first / second
        case "%": return first % second
        default:
            print("Invalid Input, Please Enter Again")
            return -1
        }
    }
}

func calculate(_ arg: String) -> Int {
    let arraySubstrings = arg.split(separator: " ")
    var arrayStrings: [String] = []
    for item in arraySubstrings {
        arrayStrings.append("\(item)")
    }
    return calculate(arrayStrings)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculateDouble(_ args: [String]) -> Double {
    if args.count == 1 {
        return 0.0
    }
    switch args.last {
    case "count":
        return Double(args.count) - 1.0
    case "avg":
        var sum = 0.0
        for i in 0..<(args.count){
            sum += (Double(args[i]) ?? 0.0)
        }
        return sum / (Double(args.count) - 1.0)
    default:
        let first : Double! = Double(args[0])
        let second : Double! = Double(args[2])
        switch args[1] {
        case "+": return first + second
        case "-": return first - second
        case "*": return first * second
        case "/": return first / second
        case "%": return first.truncatingRemainder(dividingBy: second)
        default:
            print("Invalid Input, Please Enter Again")
            return -1.0
        }
    }
}
func calculateDoubleString(_ arg: String) -> Double {
    let arraySubstrings = arg.split(separator: " ")
    var arrayStrings: [String] = []
    for item in arraySubstrings {
        arrayStrings.append("\(item)")
    }
    return calculateDouble(arrayStrings)
}

calculateDouble(["2.0", "+", "2.0"]) == 4.0
calculateDouble([".5", "+", "1.5"]) == 2.0
calculateDouble(["12.0", "-", "12.0"]) == 0.0
calculateDouble(["2.5", "*", "2.5"]) == 6.25
calculateDouble(["2.0", "/", "2.0"]) == 1.0
calculateDouble(["2.0", "%", "2.0"]) == 0.0
calculateDoubleString("1.0 2.0 3.0 4.0 5.0 count") == 5

