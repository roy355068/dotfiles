local u = hs.geometry.unitrect

local detectIDE = function()
  local ide = nil
  for _, v in ipairs(IDEs) do
    if hs.application.get(v) then
      ide = v
      break
    end
  end
  return ide
end

layoutLab = function()
  local ide = detectIDE()
  local right
  if ide then
    right = {
      {ide, nil, LAB_RIGHT_MONITOR, u(0, 0, 3/5, 1), nil, nil, visible=true},
      {'iTerm2', nil, LAB_RIGHT_MONITOR, u(3/5, 0, 2/5, 1), nil, nil, visible=true}
    }
  else
    right = {{'iTerm2', nil, LAB_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil, visible=true}}
  end
  local left = {
    {'Things', nil, LAB_LEFT_MONITOR, u(0, 0, 1/2, 1/4), nil, nil, visible=true},
    {'Calendar', nil, LAB_LEFT_MONITOR, u(1/2, 0, 1/2, 1/4), nil, nil, visible=true},
    {'Google Chrome', nil, LAB_LEFT_MONITOR, u(0, 1/4, 1, 3/4), nil, nil, visible=true},
  }
  local mb = {
    {'Keybase', nil, MACBOOK_MONITOR, u(0, 0, 1/2, 1), nil, nil, visible=true},
    {'Mail', nil, MACBOOK_MONITOR, u(1/2, 0, 1/2, 1), nil, nil, visible=true},
    {'Slack', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false},
    {'Spotify', nil, MACBOOK_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false}
  }
  return ide, concat(left, right, mb)
end


google_chrome_windows = hs.application.get('Google Chrome'):allWindows()
first = google_chrome_windows[1]:id()
second = google_chrome_windows[2]:id()
function google_chrome_geo(window)
  if window:id() == first then
    print("first chrome")
    return hs.layout.left50
      
  elseif window:id() == second then
    print("second chrome")
    return hs.layout.right50
  else
    print("why are you here???")
    return hs.layout.maximized
  end
end


layoutRoom = {
  {'Google Chrome', nil, ROOM_LEFT_MONITOR, google_chrome_geo, nil, nil, visible=true},
  {'Google Chrome', nil, ROOM_LEFT_MONITOR, google_chrome_geo, nil, nil, visible=true},
  
  
  {'iTerm2', nil, ROOM_RIGHT_MONITOR, hs.layout.maximized, nil, nil, visible=false},
  {'LINE', nil, ROOM_RIGHT_MONITOR, u(0, 0, 1, 0.2), nil, nil, visible=true},
  {'WeChat', nil, ROOM_RIGHT_MONITOR, u(0, 0.2, 1, 0.4), nil, nil, visible=true},
  {'Notion', nil, ROOM_RIGHT_MONITOR, u(0, 0.6, 1, 1), nil, nil, visible=true},
  {'Code', nil, OFFICE_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil, visible=false},
}

layoutOffice = {
  {'Google Chrome', nil, OFFICE_LEFT_MONITOR, hs.layout.left75, nil, nil, visible=true},
  {'iTerm2', nil, OFFICE_LEFT_MONITOR, hs.layout.right25, nil, nil, visible=true},
  {'Code', nil, OFFICE_RIGHT_MONITOR, u(0, 0, 1, 1), nil, nil, visible=true},
  
}


tableToSet = function(table)
  local s = {}
  if not table then
    return s
  end
  for _, v in ipairs(table) do s[v] = true end
  return s
end

applyLayout = function(name, layout)
  for _, entry in ipairs(layout) do
    local name = entry[1]
    local show = entry['visible']
    if show ~= nil then
      local app = hs.application.get(name)
      if app then
        if show then
          app:unhide()
        else
          app:hide()
        end
      else
        hs.application.launchOrFocus(name)
      end
    end
  end
  hs.layout.apply(layout)
  hs.notify.new({title='Layout', informativeText='Applied layout: ' .. name}):send()
end

rescue = function()
  local screen = hs.screen.mainScreen()
  local screenFrame = screen:fullFrame()
  local wins = hs.window.visibleWindows()
  for _, win in ipairs(wins) do
    local frame = win:frame()
    if not frame:inside(screenFrame) then
      win:moveToScreen(screen, true, true)
    end
  end
end
