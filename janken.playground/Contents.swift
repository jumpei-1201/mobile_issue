import UIKit

//methodName: janken
//Parameters: (you: HandType)
//Return type: nil

enum Hand: Int{
    case rock = 0
    case scissors = 1
    case paper = 2
}
enum Result: String{
    case win = "Win!"
    case draw = "Draw"
    case lose = "Lose"
    case no = "no much"
}

func janken( you:Hand ) {
    let num_random:Int = Int(arc4random_uniform(UInt32(3)))
    let hand:[Hand] = [.rock, .scissors, .paper]
    let pchand = hand[num_random]
    var result:Result = .no
    
    let num_result = (you.rawValue - pchand.rawValue + 3) % 3
    
    if num_result == 0 {
        result = .draw
    } else if num_result == 1 {
        result = .lose
    } else if num_result == 2 {
        result = .win
    }
    
    print("cp: \(pchand). you \(result.rawValue)")
}

janken(you: .rock)
// cp: scissors. you win!
janken(you: .scissors)
// cp: rock. you lose
janken(you: .paper)
// cp: paper. you draw
