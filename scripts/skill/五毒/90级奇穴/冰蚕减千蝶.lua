---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/90����Ѩ/���ϼ�ǧ��.lua
-- ����ʱ��:	2013/4/29 16:06:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6058) == 1 then
		player.CastSkill(6200, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com