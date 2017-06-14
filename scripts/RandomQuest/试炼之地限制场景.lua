---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/试炼之地限制场景.lua
-- 更新时间:	2015/6/23 14:02:00
-- 更新用户:	zhangtianhui1
-- 脚本说明:
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com