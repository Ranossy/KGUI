---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_施放_突.lua
-- 更新时间:	2013/4/17 20:45:58
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(418)   --获得母技能 突 的等级
	player.PlaySfx(38, player.nX, player.nY, player.nZ)
	--[[
	if player.GetSkillLevel(6511) == 1 then
		player.CastSkill(9127, dwSkillLevel)	--突伤害
	else
		player.CastSkill(431, dwSkillLevel)		--击倒附带伤害
	end
	--]]
	if player.GetBuff(9867, 1) then
		player.CastSkill(14882, dwSkillLevel)		--击倒附带伤害
	else
		player.CastSkill(431, dwSkillLevel)		--击倒附带伤害	
	end
	
	
	if player.GetSkillLevel(5700) == 1 then
		player.CastSkill(6072, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com