--data

--main functions

function _init()
 money=0
 _update=gameupdate
 _draw=gamedraw
end

function gameupdate()
 if btnp(4) then
  click()
 end
end

function click()
 money+=1
end

function gamedraw()
 cls()

 print("press x to moo",2,2)
 print("mooney: "..tostr(money),2,8)
end
