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

var initialVelocity = commandInitialVelocity.low

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
 
 ## Escape velocity:
 
 Escape velocity as the name suggests is the velocity a object has to have to escape the gravitational attractive force of the planet. Well just don’t mix things up actually you could leave a planet in a velocity slower than the escape velocity but just if you keep applying a constant force in the opposite direction like a rocket burning fuel to propel itself upwards doesn’t need to have a velocity higher the the escape velocity because the force of the burning fuel is constantly fighting against and overcoming the gravitational pull.
 
 If you throw a ball upwards at a velocity equal or higher than the escape velocity for a given planet the ball will decelerate due gravity but never at the point of stoping and coming back to the surface, otherwise if you throw a ball upwards with a velocity less than the escape velocity to object will at some point decelerate to velocity zero and will start accelerating downwards to the surface again.
 
 Notice that the stone can’t do like the rocket because stone doesn’t have a constant force being applied upwards so in order to escape it has to have the escape velocity from the beginning.
 
 The heavier is the object the harder it's to escape from its gravitational pull meaning that its escape velocity is greater than in a lighter planet.
 
 The formula for escape velocity is the following:
 
 `let Ve = sqrt(2 * G * M / R)`
 
 where:
 
 `G = Gravitational Constant`
 
 `M = Mass of the planet`
 
 `R = Radius of the planet`
 
 ## testing out
 
 Try setting different initial velocities to the ball and check how high it can go before gravity pulls it back.
 
 */

initialVelocity = .low

//: [Next Page](@next)

//#-hidden-code



sendValue(.integer(initialVelocity.rawValue))



