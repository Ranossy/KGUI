---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/90级奇穴/满月冲刺.lua
-- 更新时间:	2013/11/26 11:19:28
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	if player.GetSkillLevel(6732) == 1 then
		player.DelMultiGroupBuffByFunctionType(2)
		player.DelMultiGroupBuffByFunctionType(7)
		player.CastSkill(6531, 1)
		target.AddBuff(dwSkillSrcID, player.nLevel, 6365, 1, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com