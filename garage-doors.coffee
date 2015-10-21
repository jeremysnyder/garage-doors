if Meteor.isClient

  angular.module 'garage-doors', ['angular-meteor']

  GarageDoorCtrl = () ->
    vm = @
    vm.doors = [
      {key: 'left', name: 'Door Left', status: 'open'}
      {key: 'right', name: 'Door Right', status: 'closed'}
    ]

    vm

  angular.module('garage-doors').controller 'GarageDoorCtrl', GarageDoorCtrl
  