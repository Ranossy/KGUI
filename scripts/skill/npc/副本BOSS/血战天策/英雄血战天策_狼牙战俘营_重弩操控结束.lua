---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ӣ��Ѫս���_����ս��Ӫ_����ٿؽ���.lua
-- ����ʱ��:	2013/12/16 17:35:19
-- �����û�:	liguanghao2
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
	player.SetDynamicSkillGroup(0)
	if nLeftFrame > 0 then
		if player.GetDynamicSkillGroup() == 78 or player.GetDynamicSkillGroup() == 93 then
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