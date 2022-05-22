-- Use to search highlighted text in a new tab.
-- Intended for Chrome but should work in any
-- browser where cmd+t opens a new tab. 
-- Install Hammerspoon and include the following in
-- init.lua

hs.hotkey.bind({"cmd", "shift"}, ";", "🔍", function()
  hs.eventtap.keyStroke({"cmd"}, "c")
  hs.eventtap.keyStroke({"cmd"}, "t")
  hs.eventtap.keyStroke({"cmd"}, "v")
  hs.eventtap.keyStroke({}, "return")
end)

-- For Windows
-- https://superuser.com/questions/869324/keyboard-shortcut-to-search-for-selected-highlighted-text
