---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林禅那判定.lua
-- 更新时间:	2013/5/31 20:22:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)			--624buff——3秒回一点气
	if player.GetSkillLevel(6586) == 1 then
		if player.bFightState and player.nAccumulateValue >= 3 then
			if not player.GetBuff(6195, 1) then
				player.AddBuff(dwCharacterID, player.nLevel, 6194, 1, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 6195, 1, 1)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com