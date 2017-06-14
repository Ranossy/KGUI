---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/����������.lua
-- ����ʱ��:	10/14/11 11:55:07
-- �����û�:	LILIN1-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	-- ��ɾʱ����ͬ��scripts/Map/������/quest/�������ͨ��.lua
	local tQuestList = {	-- ����NPCΪKey���޸����������˳�����ͬ���޸�player.lh��SetPlayerTongRandomQuest()
		[10214] = {11999, 12004, 12005, 12000, 12001}, 	-- �ܶ���ʼ��һ�أ�С����ɱ����
		[7725] = {12006, 12009, 12007, 12002, 12003}, 		-- �ܶ���ʼ�����أ��η���������
		[10986] = {6570, 6571, 6572, 6573, 6574, 6583}, 	-- �ܶ���ʼ�����أ����˹ȣ���ɱ����BOSS��
		[10217] = {6584, 6576, 6581, 6578, 6579, 11191}, 	-- �ܶ���ʼ�����أ������ˣ���ɱ����BOSS��
	}
	
	if not tQuestList[dwNpcTemplateID] or #tQuestList[dwNpcTemplateID] == 0 then
		Log("TongQuestRandomError~!")
		return 0
	end
	
	local nWeekth = OnGetTongRandomWeekth(#tQuestList[dwNpcTemplateID])
	return nWeekth
end

function OnGetTongRandomWeekth(nCount)
	local nDailyOffset = 7 * 3600
	local nCycleOffset = 7 * 24 * 3600
	local nLineTime	 = DateToTime(2011, 10, 10, 0, 0, 0) + nDailyOffset
	local nNowTime	 = GetCurrentTime()	
	local nWeekth = math.floor((nNowTime - nLineTime) / nCycleOffset) % nCount + 1
	
	return math.max(1, nWeekth)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com