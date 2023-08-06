import UIKit
struct ProfileEditModel {
    let title : String
    let icon : UIImage
    let answer : String = "No value"
}
enum InfoType: String, CaseIterable  {
    case aboutMe = "About me"
    case myInfo = "My info"
}
enum AboutMe : String, CaseIterable {
    case work = "Work"
    case education = "Education"
    case gender = "Gender"
    case city = "City"
}
enum MyInfo : String, CaseIterable {
    case bio = "Biography"
    case lookingFor = "Looking For"
    case height = "Height"
    case exercise = "Exercise"
    case drinking = "Drinking"
    case smoking = "Smoking"
    case sleepingHabbits = "Sleeping Habbits"
    case dietaryPreference = "Dietary Preference"
    case religion = "Religion"
    case politics = "Politics"
    case starSign = "Star Sign"
}

enum LookingFor : String {
    case title = "What are you looking for on LoveApp"
    case icon = "pencil.circle"
    case answer1 = "A relationship"
    case answer2 = "Nothing serious"
    case answer3 = "I don't know yet"
}
enum Exercise : String {
    case title = "What are your exercise habits?"
    case icon = "pencil.circle"
    case answer1 = "Occasional exercise"
    case answer2 = "Enough cardio to keep up"
    case answer3 = "All time exercise"
}
enum Drinking : String {
    case title = "What are your exercise habits?"
    case icon = "pencil.circle"
    case answer1 = "Occasional exercise"
    case answer2 = "Enough cardio to keep up"
    case answer3 = "All time exercise"
}
enum Smoking : String {
    case title = "Your opinion on smoking?"
    case icon = "pencil.circle"
    case answer1 = "Well, I smoke"
    case answer2 = "Not a fan, but whatever"
    case answer3 = "Zero tolerance"
}
enum SleepingHabbits : String {
    case title = "When it comes to the nigtlife..."
    case icon = "pencil.circle"
    case answer1 = "I'm in bed by midnight"
    case answer2 = "I party in moderation"
    case answer3 = "I'm a night owl"
}


