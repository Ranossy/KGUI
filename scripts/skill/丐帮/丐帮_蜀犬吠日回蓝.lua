---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/ؤ��_��Ȯ���ջ���.lua
-- ����ʱ��:	2013/9/16 14:23:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local dwSkillLevel = player.GetSkillLevel(6815)
	if dwSkillLevel == 1 then
		player.nCurrentMana = player.nCurrentMana + 0.6 * player.nMaxMana
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com