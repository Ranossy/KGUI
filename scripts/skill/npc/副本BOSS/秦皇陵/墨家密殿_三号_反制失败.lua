---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/ī���ܵ�_����_����ʧ��.lua
-- ����ʱ��:	2014/3/14 11:35:52
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8950)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8951)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8952)
	local JHbuff = player.GetBuff(7606, 1)
	if JHbuff then
		if JHbuff.nLeftActiveCount > 1 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 3601), 6)
		end
	end

	player.SetDynamicSkillGroup(0)
	player.DelBuff(7346,1)
	--player.AddBuff(0, 99, 7628, 1, 3) --���ɻ�����
	--ѣ�λ�����
	player.DelBuff(7609, 1)
	player.DelBuff(7610, 1)
	player.DelBuff(7611, 1)
	player.DelBuff(7623, 1)
	player.DelBuff(7624, 1)
	player.DelBuff(7625, 1)
	player.DelBuff(7626, 1)

	player.DelBuff(7606, 1)
	player.AddBuff(0,99,7793,1,1)
end

function FanZhiShiBai(player)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8950)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8951)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8952)
	player.DelBuff(7346,1)
	player.SetDynamicSkillGroup(0)
	--player.AddBuff(0, 99, 7628, 1, 3) --���ɻ�����
	--ѣ�λ�����
	player.DelBuff(7609, 1)
	player.DelBuff(7610, 1)
	player.DelBuff(7611, 1)
	player.DelBuff(7623, 1)
	player.DelBuff(7624, 1)
	player.DelBuff(7625, 1)
	player.DelBuff(7626, 1)

	player.DelBuff(7606, 1)

	player.AddBuff(0,99,7793,1,1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com