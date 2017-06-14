---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/驱散隐身待机动作.lua
-- 更新时间:	2013/6/4 4:58:35
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.DoAction(0, 10103)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.DoAction(0, 10044)
	player.AddBuff(0, 99, 4901, 1)	--隐身消失后3秒内暗尘
	if player.GetSkillLevel(5986) == 1 then	--镇派免控
		player.CastSkill(4072, 1)
	end
	
	--if player.GetSkillLevel(5984) == 1 then	--镇派免控
		player.CastSkill(4072, 1)		--直接给解控
	--end

	--处理方士状态透明度显示
	if player.GetBuff(10827, 1) then
		player.AddBuff(player.dwID, player.nLevel, 11494, 1, 30)
	end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com