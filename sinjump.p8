pico-8 cartridge // http://www.pico-8.com
version 15
__lua__

ground_height = 100

x = 0
y = 64
xs = 1
radians = 0
dy = 0

function _init()
end

function _update() 
  x=x+xs
    
  if x>127 or x<0 then
   xs=xs*-1
  end 
  
  if y>127 or y<0 then
   ys=ys*-1
  end
  
  radians+=1
  if (radians==128) then
   radians=0
  end

  dy = sin(radians/128) * 64
  
end

function _draw()
  rectfill(0, 0, 127, ground_height, 12)
  rectfill(0, ground_height, 127, 127, 3)
  spr(0, x, y+dy)  
end

	


