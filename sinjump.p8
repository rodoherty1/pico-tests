pico-8 cartridge // http://www.pico-8.com
version 15
__lua__

ground_height = 100

x = 0
y = ground_height
degrees = 0
dh = 0
xa = 0
gravity = 0.5
jump_height=25
jumping = 0
direction=1

function jump()
  degrees+=5
  xa=1*direction

  if (degrees==180) then
   degrees=0
   jumping=0
   xa=0
  end

  dh = sin(degrees/360) * 25
end

function _init()
end

function _update()

  if btn(2) and jumping==0 then
    jumping=1
  end	
  
  if (jumping == 1) then
  	jump()
  end
      
  x=x+xa

  if x>127 or x<0 then
   direction=-direction
  end 

--  y=y+dh
  --[[
  if y>127 or y<0 then
   ys=ys*-1
  end
  --]]

  
end

function _draw()
  rectfill(0, 0, 127, ground_height, 12)
  rectfill(0, ground_height, 127, 127, 3)
  spr(0, x, y+dh)  
  print ("x:"..x.." xa: "..xa, 0, 0)
  print (direction, 0, 8)
end

