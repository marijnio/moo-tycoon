pico-8 cartridge // http://www.pico-8.com
version 22
__lua__
--data

local buildings={
 cow={
  cost=15
 },
 farm={
  cost=100
 },
}

local menus={
 buildings={
  name="buildings",
  title="select a building to purchase",
  options={
   {
    title="cow",
    desc="automatically produces 1 moo per second",
    building="cow",
   },
   {
    title="farm",
    desc="holds a ton of cows to produce 10 mps",
    building="farm",
   },
  },
  previouspage=nil,
  nextpage=nil,
 },
}

--main functions

function _init()
 money=0
 menu=nil
 menuoption=nil
 _update=gameupdate
 _draw=gamedraw
end

function gameupdate()
 if btnp(4) then
  click()
 end

 if btnp(0) then
  if menu then menu=menu.previouspage
  else
   menu=menus["buildings"]
  end
  if menu then menuoption=1 else menuoption=nil end
 end

 if btnp(1) then
  if menu then menu=menu.nextpage
  else menu=menus["buildings"]
  end
  if menu then menuoption=1 else menuoption=nil end
 end

 if menu then
  if btnp(2) then
   menuoption=menuoption-1
   if menuoption==0 then menuoption=#menu.options end
  end

  if btnp(3) then
   menuoption=menuoption+1
   if menuoption>#menu.options then menuoption=1 end
  end
 end
end

function click()
 money+=1
end

function gamedraw()
 cls()

 print("press x to moo",2,2)
 print("mooney: "..tostr(money),2,8)
 if menu then
  print("menu: "..tostr(menu.name),2,14)
 end
 if menu then drawmenu() end

 print(tostr(menuoption),2,36)
end

function drawmenu()
 local x=8
 local y=24
 for i=1,#menu.options do
  local o=menu.options[i],0
  print(o.title,24,y)
  y+=8
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
