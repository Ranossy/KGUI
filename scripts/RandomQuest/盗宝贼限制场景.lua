---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/���������Ƴ���.lua
-- ����ʱ��:	2013/7/11 14:59:55
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<

function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)	
	local tMapList = {
		6, 108, 15, 8,
	}
	for i = 1, #tMapList do
		if player.GetMapID() == tMapList[i] then
			return  1
		end
	end
	return 0
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com