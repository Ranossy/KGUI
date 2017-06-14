---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_光明相解控.lua
-- 更新时间:	2013/6/4 9:32:08
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	if player.IsExistBuffByFunctionType(2) == true then
		player.DelMultiGroupBuffByFunctionType(2)
		player.AddBuff(0, 99, 4422, 1)
	end
	if player.IsExistBuffByFunctionType(4) == true then
		player.DelMultiGroupBuffByFunctionType(4)
		player.AddBuff(0, 99, 4432, 1)
	end
	if player.IsExistBuffByFunctionType(7) == true then
		player.DelMultiGroupBuffByFunctionType(7)
		player.AddBuff(0, 99, 4434, 1)
	end
	if player.IsExistBuffByFunctionType(8) == true then
		player.DelMultiGroupBuffByFunctionType(8)
		player.AddBuff(0, 99, 4433, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com