---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_�ڳ�Ԫ��_�������_��������.lua
-- ����ʱ��:	2013/9/27 11:53:35
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame > 0 then
		player.SetDynamicSkillGroup(0)
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com