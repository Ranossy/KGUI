---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/����ó��ʱ�����.lua
-- ����ʱ��:	2014/4/22 15:04:00
-- �����û�:	lilin-kingsoft
-- �ű�˵��:
----------------------------------------------------------------------<

function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)	
	--[[local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	if tTime.hour < 2 or tTime.hour >= 10 then
		return 1
	end
	
	return 0--]]
	return 1
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com