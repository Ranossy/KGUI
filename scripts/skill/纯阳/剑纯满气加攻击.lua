---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/剑纯满气加攻击.lua
-- 更新时间:	2013/10/28 14:07:40
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
	if (not player.GetBuff(134, lv)) and (not player.GetBuff(6090, lv))and (not player.GetBuff(8867, lv))and (not player.GetBuff(8868, lv)) then
		player.DelBuff(2983,2)
	end
	--[[
	if player.GetSkillLevel(6460) == 1 then
		if player.nAccumulateValue == 10 then
			if (not player.GetBuff(6428, 1)) and player.nMoveState ~= 16 then
				player.AddBuff(dwCharacterID, player.nLevel, 6428, 1)
			end
		end
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com