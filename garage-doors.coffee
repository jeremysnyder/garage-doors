do() ->

  if Meteor.isClient

    angular.module 'garage-doors', ['angular-meteor', 'ngAnimate']

    module = angular.module('garage-doors')

    console.log angular.version

    GarageDoorCtrl = () ->
      vm = @
      vm.doors = [
        {key: 'left', name: 'Left Door', status: 'open'}
        {key: 'right', name: 'Right Door', status: 'closed'}
      ]
      vm.oppositeAction = (action) ->
        if action == 'closed' then 'open' else 'closed'
      vm.actionText = (action) ->
        if action == 'closed' then 'Close' else 'Open'
      vm.toggleDoor = (door) ->
        door.status = vm.oppositeAction door.status
        door.animationClass = 'fadeIn'
    
      return

    module.controller 'GarageDoorCtrl', GarageDoorCtrl
    
    module.animation('.slide', [() ->
        enter: (element, doneFn) ->
          console.log 'enter'
          jQuery(element).fadeIn(1000, doneFn)
        move: (element, doneFn) ->
          console.log 'move'
          jQuery(element).fadeIn(1000, doneFn)
        leave: (element, doneFn) ->
          console.log 'leave'
          jQuery(element).fadeOut(1000, doneFn)
    ])
  