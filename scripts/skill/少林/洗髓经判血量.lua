---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/洗髓经判血量.lua
-- 更新时间:	2013/6/1 3:08:02
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5927) == 1 and player.bFightState then
		if player.nCurrentLife >= player.nMaxLife * 0.9 and (not player.GetBuff(6206, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 6205, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 6206, 1, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com