// var Gpio = require('onoff').Gpio,
//   red = new Gpio(17, 'out'),
//   green = new Gpio(22, 'out'),
//   blue = new Gpio(27, 'out');
//
// function exit() {
//   red.unexport();
//   green.unexport();
//   blue.unexport();
//   process.exit();
// }
//
// function blinkLight(light, blinkRate, length) {
//   length = length || 5000;
//   blinkRate = blinkRate || 200;
//  // Toggle the state of the LED on GPIO #14 every 200ms.
//  // Here synchronous methods are used. Asynchronous methods are also available.
//   var iv = setInterval(function () {
//     light.writeSync(light.readSync() ^ 1); // 1 = on, 0 = off :)
//   }, blinkRate);
//
//  // Stop blinking the LED and turn it off after 5 seconds.
//   setTimeout(function () {
//     clearInterval(iv); // Stop blinking
//     light.writeSync(0);  // Turn LED off.
//     light.unexport();    // Unexport GPIO and free resources
//   }, length);
// }
//
// blinkLight(red, 50, 5000);
// blinkLight(green, 150, 7000);
// blinkLight(blue, 200, 8000);
