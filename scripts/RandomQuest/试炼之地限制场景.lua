---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/����֮�����Ƴ���.lua
-- ����ʱ��:	2015/6/23 14:02:00
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
local tMapList = {
	5, 2, 158, 7, 16, 102, 122, 49, 159, 150, 193,
}
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)

	for i = 1, #tMapList do
		if player.GetMapID() == tMapList[i] then
			return  0
		end
	end
	return 1
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com