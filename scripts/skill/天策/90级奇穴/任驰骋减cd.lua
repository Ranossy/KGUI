---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/任驰骋减cd.lua
-- 更新时间:	2013/5/28 22:18:53
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	ModityCDToUI(player, 433, 0, 0)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6515) == 1 then
		if not player.GetBuff(6127, 1) then
			if player.GetCDLeft(108) ~= 0 then
				player.AddBuff(dwCharacterID, player.nLevel, 6126, 1, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com