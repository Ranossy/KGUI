---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/���³��.lua
-- ����ʱ��:	2013/11/26 11:19:28
-- �����û�:	taoli
-- �ű�˵��:	
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com