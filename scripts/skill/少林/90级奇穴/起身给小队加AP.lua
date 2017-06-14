---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/90级奇穴/起身给小队加AP.lua
-- 更新时间:	2013/5/15 10:05:28
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
	player.AddBuff(dwCharacterID,player.nLevel,7119,1,1)
	if player.GetSkillLevel(5908) == 1 then
		player.CastSkill(6149, 1)
		player.PlaySfx(484, player.nX, player.nY, player.nZ)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com