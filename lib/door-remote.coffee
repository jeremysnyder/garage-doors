TestDoorRemote =
  register: (doors) ->
    console.log '[TEST] Registering Doors...'
    console.log "[TEST] Setting up remote for #{d.name} on GPIO port #{d.gpioPort}..." for d in doors
  open: (door) ->
    console.log "[TEST] Opening #{door.name}"
  close: (door) ->
    console.log "[TEST] Closing #{door.name}"

PiDoorRemote =
  register: (doors) ->
    Gpio = Npm.require('onoff').Gpio
    for d in doors
      console.log "Setting up remote for #{d.name} on GPIO port #{d.gpioPort}..."
      d.gpio = new Gpio(d.gpioPort, 'out')
      console.log "#{d.name} setup complete"


    # fs = Npm.require('fs')
    # stats = fs.lstatSync('/usr/local/workspaces')
    # console.log(stats.isDirectory())
    # leftLed = new Gpio(17, 'out')
    # rightLed = new Gpio(27, 'out')
    # leftLed.writeSync(1)
    # rightLed.writeSync(1)


  open: (door) ->
    console.log "Opening #{door.name}"
    door.gpio.writeSync 1
  close: (door) ->
    console.log "Closing #{door.name}"
    door.gpio.writeSync 0

# TODO Use PiDoorRemote if GPIO is present, else, use TestDoorRemote
@DoorRemote = TestDoorRemote
