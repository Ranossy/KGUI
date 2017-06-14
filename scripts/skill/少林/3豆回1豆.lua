---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/3豆回1豆.lua
-- 更新时间:	2013/5/30 20:36:13
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local i = Random(1, 1000)
	if player.GetSkillLevel(5903) == 1 and not player.GetBuff(10010, 1) then
		if i > 500 then
			--[[
			if not player.GetBuff(6168, 1) then
				player.CastSkill(1018, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 6168, 1, 1)
			end
			--]]
			player.AddBuff(player.dwID, player.nLevel, 10010, 1)
			player.CastSkill(1018, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com