---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_ɽ��_�����ж�.lua
-- ����ʱ��:	2013/10/24 9:42:53
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if scene.dwMapID == 175 then
		if player.nZ <= 1053824 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 722), 3)
			if player.GetBuff(6893, 1) then
				player.DelGroupBuff(6893, 1)
			end
		
			if player.GetBuff(6900, 1) then
				player.DelGroupBuff(6900, 1)
			end
		
			if player.GetBuff(6908, 1) then
				player.DelBuff(6908, 1)
			end
		
			if player.GetBuff(6907, 1) then
				player.DelBuff(6907, 1)
			end
		end
	end
	
	if scene.dwMapID == 176 then
		if player.nZ <= 1053824 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 722), 3)
			if player.GetBuff(6893, 2) then
				player.DelGroupBuff(6893, 2)
			end
		
			if player.GetBuff(6900, 1) then
				player.DelGroupBuff(6900, 1)
			end
		
			if player.GetBuff(6908, 1) then
				player.DelBuff(6908, 1)
			end
		
			if player.GetBuff(6907, 1) then
				player.DelBuff(6907, 1)
			end
			
			if player.GetBuff(7148, 1) then
				player.DelBuff(7148, 1)
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com