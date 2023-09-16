# void_doorlocks-vorp

> A RedM Doorlock system for [Vorp Core](http://docs.vorpcore.com:3000/)

Join the [VORP Community Discord](https://discord.gg/23MPbQ6)

## Features
1. Toggle between Using item or Alt button to open doors
2. Lock breaking doors
3. Possibility to use different item for each door

## Installation
1. Download this repo/codebase
2. Extract and place `void_doorlocks-vorp` into your `resources` folder
3. Add `ensure void_doorlocks-vorp` to your `server.cfg` file
4. Restart your server (unless you have nightly restarts)

## Dependency
- [VORP Core](https://github.com/VORPCORE/vorp-core-lua)
- [VORP Inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [VORP Character](https://github.com/VORPCORE/VORP-Character)
- [lockpick](https://github.com/VoidZero69/lockpick)

## How-to-configure
If the Config.useitems is set to True :
authorizedItem is responsible of locking/unlocking doors
authorizedJobs will be neglected in the process

If the Config.useitems is set to False :
Alt button is responsible of locking/unlocking doors (authorizedJob used for this)

Using Lockbreaker :
You can use it whether the Config.useitems is set to True or False
+You can choose if the door can be lockbreakable or not (canlockbreak)

## Disclaimers and Credits
  - This is a modification to [bulgar_doorlocks_vorp] (Made by Bulgar)

## Do not forget to:
- ensure this resource after its dependencies 
- if you're adding a new key item you need to register it in the server side
- add the item in db
- exemples are provided in `/config.lua` and `/server/main.lua



