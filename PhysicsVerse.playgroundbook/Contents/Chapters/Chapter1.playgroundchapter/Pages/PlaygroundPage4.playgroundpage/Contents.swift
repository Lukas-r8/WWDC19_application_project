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
 
 ## Schwarzschild radius
 Schwarzschild radius is the radius at which an object of certain mass will become so dense that its gravity will become terribly intense and its escape velocity will be greater than speed of light meaning that nothing not even light could escape its gravitational pull, in physics these objects are known as black holes and they can’t be observed directly because there’s no light coming out of it.
 
 The formula to calculate Schwarzschild radius is the following:
 
 `let Rs = (2 * G / c * c) * M`
 
 where:
 
 `let Rs = Schwarzschild radius `
 
 `G = Gravitational constant`
 
 `c = Speed of light constant`
 
 `M = Mass of object`
 
 As the formula states the bigger the mass, the bigger the Schwarzschild radius but if you keep indefinitely adding mass to an object eventually its calculated Schwarzschild radius will reach the actual radius therefore becoming a black hole.
 
 The Schwarzschild radius or our planet earth is about 1cm it means that if you crush all matter earth’s matter in a region smaller than 1cm you’ll turn earth into a black hole, the same goes for the sun but you’d need to crush all the sun’s matter in a region of about 3KM to get the same effect.
 
 ## Creating a black hole
 
 Basically there’s two ways of how you could create a black hole one is cramming a lot of mass together till its radius reach its Schwarzschild radius for its mass or keep adding mass to the object in this way the radius of the object will increase also but the Schwarzschild radius will increase at a higher rate so eventually it’ll become a black hole.
 
 
 ## Testing out
 
 Choose a number between 1 and 20.
 
 Try adding solar masses to our star and see how far you can go till you reach the Schwarzschild radius and turn our star into a black hole.

 
 */

let numberOfStarsToAdd: Int = 5


//#-hidden-code

var valueToSend = numberOfStarsToAdd > 20 ? 20 : numberOfStarsToAdd
    valueToSend = valueToSend < 1 ? 1 : valueToSend

sendValue(.integer(valueToSend))



