---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/���״̬BUFF.lua
-- ����ʱ��:	03/15/10 14:10:37
-- �����û�:	chenjiancong
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local npcControl = GetNpc(nCharacterID)
	if not npcControl then
		return
	end

	npcControl.FireAIEvent(2001, 0, 0)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com