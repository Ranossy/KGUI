---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/�����¼�����������.lua
-- ����ʱ��:	2014/7/3 15:30:03
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<
local tActivityList = {
	-- [dwNpcTemplateID] = �ID
	[7707] = 251,
	[7708] = 252,
	[7709] = 253,
	[7706] = 254,
	[7710] = 255,
	[15223] = 256,
	[9443] = 257,
	[7712] = 258,
	[19238] = 259,
	[25513] = 260,
	[24444] = 261,
	[40884] = 282,
}
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)

	if tActivityList[dwNpcTemplateID] then
		
		local dwActivityID = tActivityList[dwNpcTemplateID]
		if IsActivityOn(dwActivityID) then 
			return 1
		else
			return 0
		end
	end
	return 0
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com