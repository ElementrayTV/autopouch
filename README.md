# AutoPouch for Windower

**AutoPouch** is a Windower Lua addon for Final Fantasy XI that automatically uses Toolbags, Quivers, and Pouches when your tool/ammo count drops below a threshold.

## Features
- Automatically uses pouches when tools or ammo are low
- Supports all Ninja tools, bullets, arrows, and bolts
- Per-job and subjob filtering
- Adjustable threshold via `settings.xml`
- Prevents chat spam with smart cooldowns

## Installation
1. Copy the `autopouch` folder to `Windower/addons/`
2. In game: `//lua load autopouch`
3. Edit `settings.xml` to customize thresholds and jobs

## Example Config
```xml
<pair main="Shihei" pouch="Toolbag (shihe)" job="NIN" />
