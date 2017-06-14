---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/终结技回10点能量.lua
-- 更新时间:	2015/9/21 15:53:49
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(6722) == 1 then
		player.SetTimer(4, "scripts/skill/明教/终结技回10点能量.lua", nParam1, nParam2)
		--player.nCurrentMoonEnergy = player.nCurrentMoonEnergy + 1000
		--player.nCurrentSunEnergy = player.nCurrentSunEnergy + 1000
	end
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.nCurrentMoonEnergy = player.nCurrentMoonEnergy + 1000
	player.nCurrentSunEnergy = player.nCurrentSunEnergy + 1000
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com