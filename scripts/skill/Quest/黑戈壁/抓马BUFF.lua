---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�ڸ��/ץ��BUFF.lua
-- ����ʱ��:	2015/10/20 16:12:52
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--���ʱ����һ��

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)--
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local nQuestID = 14595   --�����Ҵ���
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and nQuestPhase < 3 then
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "ѱ��ʧ�ܣ�Ұ����ʧ�ˣ�", 4)
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
	local npc = scene.GetNpcByNickName("beizhuayema" .. player.dwID)
	if npc then
		npc.SetDisappearFrames(1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com