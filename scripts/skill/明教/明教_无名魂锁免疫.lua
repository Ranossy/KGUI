---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_无名魂锁免疫.lua
-- 更新时间:	2016/12/5 16:55:26
-- 更新用户:	qinfupi
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/skill/Map/主城安全区/主城安全区域.lh")

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local buff = player.GetBuff(11549, 0)
	
	if CheckIfCitySafeArea(player) then
		if buff.nLevel == 1 and buff.nLeftActiveCount == 1	 then	--判断buff的最后一跳，转换为免疫buff
			player.DelBuff(11549, 1)
			player.AddBuff(0, 99, 11549, 2, 180)
		end
	else
		player.DelBuff(11549, buff.nLevel)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com