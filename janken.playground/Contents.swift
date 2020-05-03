import UIKit

//methodName: janken
//Parameters: (you: HandType)
//Return type: nil

enum Hand{
    case rock, scissors, paper
}
enum Result{
    case win, draw, lose
}

func janken( you:Hand ) -> Optional<Int>{
    let num_random:Int = Int(arc4random_uniform(UInt32(3)))
    let hand:[String] = ["rock", "scissors", "paper"]
//    print(num_random)
    let pchand:String = hand[num_random]
    var result:String = "no much"
    switch you {
    case .rock :
        if pchand == "rock" {
            result = "you draw"
        }else if pchand == "scissors" {
            result = "you win!"
        }else if pchand == "paper" {
            result = "you lose"
        }
    case .scissors:
        if pchand == "rock" {
            result = "you lose"
        }else if pchand == "scissors" {
            result = "you draw"
        }else if pchand == "paper" {
            result = "you win!"
        }
    case .paper:
        if pchand == "rock" {
            result = "you win!"
        }else if pchand == "scissors" {
            result = "you lose"
        }else if pchand == "paper" {
            result = "you draw"
        }
    }
    print("cp : \(pchand).", result, separator: " ")
    return nil
}


janken(you: .rock)
// cp: scissors. you win!
janken(you: .scissors)
// cp: rock. you lose
janken(you: .paper)
// cp: paper. you draw
