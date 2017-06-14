---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/盗宝贼限制场景.lua
-- 更新时间:	2013/7/11 14:59:55
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com