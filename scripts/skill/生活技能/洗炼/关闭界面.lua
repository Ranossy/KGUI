---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�����/ϴ��/�رս���.lua
-- ����ʱ��:	2013/9/12 11:13:38
-- �����û�:	zhangyan3
-- �ű�˵��:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then 
		return
	end
	
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseEquipMagicChange")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseEquipMagicChangeBack")
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com