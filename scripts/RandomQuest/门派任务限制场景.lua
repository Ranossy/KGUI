---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/�����������Ƴ���.lua
-- ����ʱ��:	2015/10/3 23:13:35
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<
local tMapList = {
	2, 5, 7, 11,13, 16, 49, 102, 122, 150, 159, 6, 8, 15, 108, 153, 158, 193, 194, 213, 243
}
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)

	for i = 1, #tMapList do
		if player.GetMapID() == tMapList[i] then
			return  1
		end
	end
	return 0
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com