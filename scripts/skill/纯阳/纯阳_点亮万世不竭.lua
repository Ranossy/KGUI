---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/纯阳_点亮万世不竭.lua
-- 更新时间:	2013/6/21 23:55:29
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(312)
	if (not player.IsHaveBuff(134, lv)) and (not player.IsHaveBuff(6090, lv)) and (not player.IsHaveBuff(8867, lv))and (not player.IsHaveBuff(8868, lv))then
		player.DelBuff(2983,2)
	end
	if player.nAccumulateValue >= 10 then
		--if not player.GetBuff(6422,1) then
		player.AddBuff(dwCharacterID, player.nLevel, 6422, 1, 1)
		--end
	else
		player.DelBuff(6422, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com