---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/������������ʧ��.lua
-- ����ʱ��:	2014/4/3 17:25:12
-- �����û�:	zhouyixiao2
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
	player.DelBuff(7346, 1) --���ɻ�����
	player.DelBuff(7468, 1) --���ڵ�������
	player.DelBuff(7469, 1) --������
	player.DelBuff(7514, 1) --������
	player.DelBuff(7710, 1) --��ʧ�ܱ��
	player.DelBuff(7711, 1) --��ʧ�ܱ��
	player.DelBuff(7467, 1) --���ƻ���
end

function FanZhiShiBai(player)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8802)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8803)
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7346, 1) --���ɻ�����
	player.DelBuff(7468, 1) --���ڵ�������
	player.DelBuff(7469, 1) --������
	player.DelBuff(7514, 1) --������
	player.DelBuff(7710, 1) --��ʧ�ܱ��
	player.DelBuff(7711, 1) --��ʧ�ܱ��
	player.DelBuff(7467, 1) --���ƻ���
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com