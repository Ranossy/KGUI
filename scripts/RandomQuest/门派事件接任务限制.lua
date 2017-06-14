---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/门派事件接任务限制.lua
-- 更新时间:	2014/7/3 15:30:03
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<
local tActivityList = {
	-- [dwNpcTemplateID] = 活动ID
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com