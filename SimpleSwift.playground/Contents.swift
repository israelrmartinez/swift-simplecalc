print("Welcome to the UW Calculator Playground")

// Taken from https://www.tutorialkart.com/swift-tutorial/swift-factorial/
func factorial(n: Int) -> Int {
    var result = 1
    if(n > 0) {
        for i in 1...n {
            result *= i
        }
    }
    return result
}

func calculate(_ args: [String]) -> Int {
    if args.count > 1 {
        if args[1] == "+" {
            let first = Int(args[0]) ?? 0
            let second = Int(args[2]) ?? 0
            return (first + second)
        } else if args[1] == "-" {
            let first = Int(args[0]) ?? 0
            let second = Int(args[2]) ?? 0
            return (first - second)
        } else if args[1] == "*" {
            let first = Int(args[0]) ?? 0
            let second = Int(args[2]) ?? 0
            return (first * second)
        } else if args[1] == "/" {
            let first = Int(args[0]) ?? 0
            let second = Int(args[2]) ?? 0
            return (first / second)
        } else if args[1] == "%" {
            let first = Int(args[0]) ?? 0
            let second = Int(args[2]) ?? 0
            return (first % second)
        }
        let opr = args[args.count - 1]
        if opr == "count" {
            let num = Int(args[args.count - 2]) ?? 0
            return num
        }
        if opr == "avg" {
            var nums = [Int]()
            var index : Int = 0
            repeat {
                let val = Int(args[index]) ?? 0
                nums.append(val)
                index += 1
            } while index < args.count - 1
            return nums.reduce(0, +) / nums.count
        }
        if opr == "fact" {
            let num = Int(args[0]) ?? 0
            return factorial(n: num)
        }
    }
    
    return 0
}

func calculate(_ arg: String) -> Int {
    let strArray = arg.split{$0 == " "}.map(String.init)
    return calculate(strArray)
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

func calculate(_ args: [String]) -> Double {
    if args.count > 1 {
        if args[1] == "+" {
            let first = Double(args[0]) ?? 0
            let second = Double(args[2]) ?? 0
            return (first + second)
        } else if args[1] == "-" {
            let first = Double(args[0]) ?? 0
            let second = Double(args[2]) ?? 0
            return (first - second)
        } else if args[1] == "*" {
            let first = Double(args[0]) ?? 0
            let second = Double(args[2]) ?? 0
            return (first * second)
        } else if args[1] == "/" {
            let first = Double(args[0]) ?? 0
            let second = Double(args[2]) ?? 0
            return (first / second)
        } else if args[1] == "%" {
            let first = Double(args[0]) ?? 0
            let second = Double(args[2]) ?? 0
            return Double(first).truncatingRemainder(dividingBy: second)
        }
        let opr = args[args.count - 1]
        if opr == "count" {
            let num = Double(args[args.count - 2]) ?? 0
            return num
        }
    }
    return -1.0
}
func calculate(_ arg: String) -> Double {
    let strArray = arg.split{$0 == " "}.map(String.init)
    return calculate(strArray)
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
