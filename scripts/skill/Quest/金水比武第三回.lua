---------------------------------------------------------------------->
-- 脚本名称:	Scripts\Map\金水镇\skill\金水比武第三回.lua
-- 更新时间:	09/08/08 14:35:38
-- 更新用户:	tangyiming3
-- 脚本说明:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local nQuestID = 1674
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if IsPlayer(nCharacterID) and nLeftFrame ~= 0 and nQuestIndex and player.GetQuestValue(nQuestIndex, 0) ~= 1 then
		if not player.GetQuestFailedFlag(nQuestIndex) then
			player.SetQuestFailedFlag(nQuestIndex, 1)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com