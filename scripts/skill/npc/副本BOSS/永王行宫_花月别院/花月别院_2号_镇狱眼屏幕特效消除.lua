---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_2��_��������Ļ��Ч����.lua
-- ����ʱ��:	2015/6/16 19:05:57
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
 function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
 	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
 	
	if player then
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "Character_StopFullScreenSFX", player.dwID)
	end
 end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com