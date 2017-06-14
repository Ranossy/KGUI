---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/破风添加易伤效果.lua
-- 更新时间:	2015/6/16 14:50:56
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	--破风易伤
	if player.IsSkillRecipeActive(2005, 1) then
		if player.IsSkillRecipeActive(375, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(8139, 2, TARGET.PLAYER, target.dwID)
			else
				player.CastSkill(8139, 2, TARGET.NPC, target.dwID)
			end
		else
			if IsPlayer(dwCharacterID) then
				player.CastSkill(8139, 1, TARGET.PLAYER, target.dwID)
			else
				player.CastSkill(8139, 1, TARGET.NPC, target.dwID)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com