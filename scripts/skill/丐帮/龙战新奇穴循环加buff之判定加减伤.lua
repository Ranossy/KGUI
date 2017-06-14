---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_施放_突.lua
-- 更新时间:	2013/4/17 20:45:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6821) == 1 then
		if player.bFightState == true and player.nCurrentMana == player.nMaxMana and not player.GetBuff(7790,2) and not player.GetBuff(7791, 1) then
			player.AddBuff(player.dwID, player.nLevel, 7790, 2)
		end

		if player.bFightState == true and player.nCurrentMana ~= player.nMaxMana and player.GetBuff(7790, 2) then
			player.DelBuff(7790, 2)
			player.AddBuff(player.dwID, player.nLevel, 7790, 1)
			player.AddBuff(player.dwID, player.nLevel, 7791, 1)
		end

		if player.bFightState == false then
			if player.GetBuff(7790, 2) then
				player.DelBuff(7790,2)
			end

			if player.GetBuff(7790, 1) then
				player.DelBuff(7790,1)
			end
		end
	else
		if player.GetBuff(7790, 2) then
			player.DelBuff(7790,2)
		end

		if player.GetBuff(7790, 1) then
			player.DelBuff(7790,1)
		end
		if player.GetBuff(7789, 1) then
			player.DelBuff(7789,1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com