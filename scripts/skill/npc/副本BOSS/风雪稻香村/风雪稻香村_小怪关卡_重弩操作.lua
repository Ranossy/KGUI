---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_��������_ҩʦ��_�������.lua
-- ����ʱ��:	2013/10/23 14:38:05
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame > 0 then
		if player.GetDynamicSkillGroup() == 164 then
			player.SetDynamicSkillGroup(0)
		end
		local npcZN = GetNpc(nCustomValue)
		if npcZN then
			npcZN.SetDialogFlag(1)
			npcZN.SetCustomBoolean(1, false)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com