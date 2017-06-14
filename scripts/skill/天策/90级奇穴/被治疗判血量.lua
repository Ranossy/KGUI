---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/被治疗判血量.lua
-- 更新时间:	2013/6/5 4:52:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.nCurrentLife <= player.nMaxLife * 0.4 then
		player.AddBuff(dwCharacterID, player.nLevel, 6310, 1, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com