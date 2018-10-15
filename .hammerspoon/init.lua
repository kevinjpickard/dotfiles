-- System Variables --
hs.window.animationDuration = 0 -- Turn off window animation, its smoother

-- Tiling Init -- 
--local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local mash = {"ctrl", "cmd"}

-- If you want to set the layouts that are enabled --
--tiling.set('layouts', {
--  'fullscreen', 'main-vertical'
--})
--
--hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
--hotkey.bind(mash, "j", function() tiling.cycle(1) end)
--hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
--hotkey.bind(mash, "space", function() tiling.promote() end)
--hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)

-- Spotify Hotkeys --
hotkey.bind(mash, "]", function() hs.spotify.next() hs.spotify.displayCurrentTrack() end)
hotkey.bind(mash, "[", function() hs.spotify.previous() end)
hotkey.bind(mash, "\\", function() hs.spotify.displayCurrentTrack() end)
hotkey.bind(mash, "p", function() hs.spotify.playpause() end)

-- Volume Control --
local volumeIncrement = 5
hotkey.bind(mash, "-", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume - volumeIncrement) end)
hotkey.bind(mash, "=", function() hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.current().volume + volumeIncrement) end)

-- Reload hammerspoon configs
hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

require('aerosnap')

-- Vim Grid Keys
hs.grid.setGrid('2x2')
hs.grid.setMargins('0x0')

function moveWindow(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- bind hotkeys to grid 
hs.hotkey.bind(mash,"y", function() moveWindow(0.0,0.0,0.5,0.5) end)
hs.hotkey.bind(mash,"u", function() moveWindow(0.0,0.0,1.0,0.5) end)
hs.hotkey.bind(mash,"i", function() moveWindow(0.5,0.0,0.5,0.5) end)
hs.hotkey.bind(mash,"h", function() moveWindow(0.0,0.0,0.5,1.0) end)
hs.hotkey.bind(mash,"j", function() moveWindow(0.0,0.0,1.0,1.0) end)
hs.hotkey.bind(mash,"k", function() moveWindow(0.5,0.0,0.5,1.0) end)
hs.hotkey.bind(mash,"n", function() moveWindow(0.0,0.5,0.5,0.5) end)
hs.hotkey.bind(mash,"m", function() moveWindow(0.0,0.5,1.0,0.5) end)
hs.hotkey.bind(mash,",", function() moveWindow(0.5,0.5,0.5,0.5) end)
