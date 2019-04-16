//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//


//Messaging from Page to Live View:
import Foundation
import simd

var planet = PlanetsOption.venus
var mass: Double = 80

//Use the call below to send a message with an object to the LiveView of this page. Import Foundation is required.






//Give hints and final solution:
//PlaygroundPage.current.assessmentStatus = .fail(
//hints: [
//"You could [...].",
//"Try also [...]."
//],
//solution:
//"Do [...]."
//)





// Completion of user-entered code:
//Use //#-code-completion syntax to allow only specified code to be entered by the user. (info here: https://developer.apple.com/documentation/swift_playgrounds/customizing_the_completions_in_the_shortcut_bar)


//#-end-hidden-code

/*: some text
 
 # Introduction
 
 One thing that most people have a wrong idea about is the belief that __mass__ is the same thing as __weight__, but it is not, to understand this fact let’s take a look at definitions:
 
 ## Mass
 
 Mass is the amount of matter present in an object no matter its size, an object may contain different amount of mass per volume it just means that the density of this object is different but not its mass.
 
 According to SI (International System of Units) the Unit of mass is the KG (Kilogram).
 
 ## Weight

 Here things start getting interesting the __weight__ is the gravitational pull of a more massive object on a less massive object, it is how strong a planet for example pull on you because of your mass.
 
 So you DO weight differently depending on which planet you’re on because the acceleration due to gravity on that planet will be different than acceleration in any other planet.
 
 According to SI (International System of Units) the Unit of weight is the N (Newton).
 
 ## Acceleration
 
 Because gravity is an attractive force whenever you put two objects in the empty space they will start accelerating towards each other, the more massive is the planet the greater will be the acceleration of  objects towards it.
 
 But hold on for a second two objects of different masses would accelerate at the same rate towards the planet no matter if the first object has just 1KG and the second object 1000KG, that’s because acceleration is not related to the mass of attracted objects instead it’s given by the attractor object, so as long the mass of the planet doesn’t change the acceleration will remain the same.
 
 The formula to calculate the __acceleration__ that show this is the following:
 
 `let g = G * M / rˆ2`
 
 where:
 
 `let G = Gravitational Constant -> 6.67 * 10ˆ-11`
 
 `let M = Mass of the object`
 
 `let r = Radius of a celestial object`
 
 As you can see the formula is dependant on the attractor itself, so all objects will be accelerated at same rate in a given planet.
 
 ## Testing Out

 Choose a __planet__ and see how __acceleration__ of mass changes for each planet, also insert your __mass in KG__ and see what would be the mass for the same __weight__ on earth, right at the __earth’s equivalent field__.
 
 See you on the next Page :)
 
 */

planet = .venus
mass = 80

//: [Next Page](@next)

//#-hidden-code

var dataToSend: [String: Any] = ["mass":mass,"planet":planet.rawValue]

func getData(_ dict: [String: Any]) -> Data {
    let data = try? NSKeyedArchiver.archivedData(withRootObject: dict, requiringSecureCoding: false)
    return data ?? Data()
}

sendValue(.data(getData(dataToSend)))








