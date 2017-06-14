---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_奔雷枪术_御减血.lua
-- 更新时间:	2013/5/30 10:53:46
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff
	for i = 1, 6 do
		buff = player.GetBuff(360, i)
		if buff then
			return
		end
	end
	--[[
	if not buff and player.GetBuff(6159,1) then
		player.DelBuff(6159, 1)
	end
	--]]
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com