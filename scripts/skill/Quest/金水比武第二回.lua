---------------------------------------------------------------------->
-- �ű�����:	Scripts\Map\��ˮ��\skill\��ˮ����ڶ���.lua
-- ����ʱ��:	09/08/08 14:31:29
-- �����û�:	tangyiming3
-- �ű�˵��:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local nQuestID = 1673
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if IsPlayer(nCharacterID) and nLeftFrame ~= 0 and nQuestIndex and player.GetQuestValue(nQuestIndex, 0) ~= 1 then
		if not player.GetQuestFailedFlag(nQuestIndex) then
			player.SetQuestFailedFlag(nQuestIndex, 1)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com