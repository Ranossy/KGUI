---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_������_���ս���.lua
-- ����ʱ��:	2014/2/14 15:04:29
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8802)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8803)
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7468, 1)
	player.DelBuff(7469, 1)
	player.DelBuff(7514,1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com