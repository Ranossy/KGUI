---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/���״̬BUFF.lua
-- ����ʱ��:	03/15/10 14:10:37
-- �����û�:	chenjiancong
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	
	RemoteCallToClient(player.dwID, "OnCloseExamPanel")
	
	if nLeftFrame == 0 then
		player.SendSystemMessage(GetEditorString(4, 4848))
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com