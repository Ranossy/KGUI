---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ִ����/����_��ؿ���_����ѣ��.lua
-- ����ʱ��:	2016/8/18 15:43:04
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 873
	if not player.GetQuestIndex(nQuestID) or player.GetQuestPhase(nQuestID) ~= 1 then --��������ֻҪ��һ��û��ɣ���Ҫִ����ȥ
		nQuestID = 15587
	end
	if player then
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		if nQuestPhase == 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.SetKillNpcCount(nQuestIndex, 0, 5)
			player.SetKillNpcCount(nQuestIndex, 1, 2)
			player.Stop()
			player.AddBuff(0, 99, 1736, 1)
			local tText = {
				GetEditorString(2, 6694),
				GetEditorString(2, 6692),
				"",
				GetEditorString(2, 6690),
				GetEditorString(2, 6691),
				"",
				GetEditorString(2, 6693),
			}
			RemoteCallToClient(player.dwID, "StartFilterMask", 60, 70, 130, {0, 0, 0}, false, true, tText)
		end
	end
--�����¼���
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com