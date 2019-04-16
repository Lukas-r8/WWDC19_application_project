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

var speed = CommandLive.low

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
 ### Gravity
 
 Gravity is one of the most misterious forces in our universe.
 Thanks to gravity our solar system could be put together, so life could evolve.
 
 Everything falls towards the ground because gravity cause objects with mass to accelerate towards other objects with mass, everything in the known universe is influenced by gravity, even very far away objects.
 
 The formula to calculate the gravitational force is as follows...
 
 `let GravityForce = (G * m1 * m2) / r * r`
 
 where:

 `let G = Gravitational Constant -> 6.67 * 10ˆ-11`

 `let m1 = mass of the first object in Kg`
 
 `let m2 = mass of the second object in Kg`
 
 `let r = distance between objects in meters`
 
 ### Planetary Orbits:
 
 Planets may have 4 types of orbit, they are:
 
 1. Elliptical Orbit.
    This orbit is the most commom orbit along the universe, when a planet is captured by a stars's gravity it's much more likely it's going to have an Elliptical Orbit. It happens when the planet has a perfect velocity and appropriate distance from the star.
 
 2. Circular Orbit.
    This is a very rare Orbit and may be considered virtually impossible because a number of variable has to be just perfect for this kind of orbit to happen. like a perfect combination of distance, velocity and masses. It may happen in a moderate velocity on favourable conditions of distance and mass.
 
 3. Hyperbolic Orbit.
    This is a ephemeral orbit due to the planet's high speed and distance from the star, this orbit has "U" shape it means that the planet's path will be bent by the star but it will NOT be captured on it's gravitational field. the planet will go past the star and will not come back. It's likely to happen when the planet's velocity is High.
 
 4. Spiral Orbit.
    This is a deadly orbit path, because in this case the planet doesn't have enough velocity to escape the star's gravitational field nor enough velocity to stay in a stable orbit like circular or elliptical ones, so it'll simply spiral towards the center of mass of the star and will eventually merge with the star's mass, not a happy ending. It normally happens when planet velocity is low.
 
 See you on the next Page :)

*/

speed = .low


//: [Next Page](@next)

 //#-hidden-code



sendValue(.integer(speed.rawValue))
 







