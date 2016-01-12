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
// function turn(light, value, forTime) {
//   forTime = forTime || 5000;
//   setTimeout(function() {
//     light.writeSync(value);
//   }, forTime);
// }
//
// function turnOn(light, forTime) {
//   turn(light, 1, forTime);
// }
//
// function turnOff(light, forTime) {
//   turn(light, 0, forTime);
// }
//
// function turnOnAndOff(light, forTime) {
//   forTime = forTime || 5000;
//   setTimeout(function() {
//     light.writeSync(1);
//     setTimeout(function() {
//       light.writeSync(0);
//     }, forTime);
//   }, forTime);
// }
//
// turnOnAndOff(red, 2000);
// turnOnAndOff(blue, 1000);
// turnOnAndOff(green, 4000);
//
// // turnOff(green);
// // turnOff(blue);
// // turnOff(red);
// setTimeout(exit, 15000);
