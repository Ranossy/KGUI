---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/附魔_破风附带减灭CD的子技能.lua
-- 更新时间:	2014/7/3 15:37:11
-- 更新用户:	mengxiangfei
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

	--有S_9290流血减灭调息
	if player.GetSkillLevel(9290) == 1 and player.GetKungfuMount().dwSkillID == 10026 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9291, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(9291, 1, TARGET.NPC, dwCharacterID)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com