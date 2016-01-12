Doors = new Mongo.Collection 'doors'

if Meteor.isServer
  Meteor.startup () ->
    if Doors.find().count() == 0
      console.log 'Initializing Doors...'
      doors = [
        {key: 'left', name: 'Left Door', status: 'open', gpioPort: 17}
        {key: 'right', name: 'Right Door', status: 'close', gpioPort: 27}
      ]

      Doors.insert d for d in doors

if Meteor.isClient
  angular.module 'garage-doors', ['angular-meteor', 'ngAnimate']

  module = angular.module('garage-doors')

  GarageDoorCtrl = ['$scope', '$reactive', ($scope, $reactive) ->
    vm = @
    vm.registered = false
    $reactive(vm).attach $scope

    vm.helpers
      doors: -> Doors.find {}

    stopWatchingForNewDoors = $scope.$watchCollection 'vm.doors', (doors) ->
      if !vm.registered && doors? && doors.length
        DoorRemote.register(doors) if !vm.registered && doors?
        vm.registered = true
        stopWatchingForNewDoors()

    vm.oppositeAction = (action) ->
      if action == 'close' then 'open' else 'close'
    vm.actionText = (action) ->
      if action == 'close' then 'Close' else 'Open'
    vm.onOff = (action) ->
      if action == 'close' then 0 else 1
    vm.toggleDoor = (door) ->
      action = vm.oppositeAction door.status
      door.status = action
      door.animationClass = 'fadeIn'
      remoteAction = DoorRemote[action]
      remoteAction door
      Doors.update door._id, {$set: {status: action}}
      # door.light.writeSync(vm.onOff(action))

    vm
  ]

  doorAnimation = [() ->
    enter: (element, doneFn) ->
      console.log 'enter'
      jQuery(element).fadeIn(1000, doneFn)
    move: (element, doneFn) ->
      console.log 'move'
      jQuery(element).fadeIn(1000, doneFn)
    leave: (element, doneFn) ->
      console.log 'leave'
      jQuery(element).fadeOut(1000, doneFn)
  ]

  module.controller 'GarageDoorCtrl', GarageDoorCtrl

  module.animation '.slide', doorAnimation
