---------------------------------------------------------------------->
-- 脚本名称:	Scripts\Map\金水镇\skill\通缉任务_璟.lua
-- 更新时间:	09/08/08 11:57:20
-- 更新用户:	tangyiming3
-- 脚本说明:	
----------------------------------------------------------------------<

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local nQuestID = 2750
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if IsPlayer(nCharacterID) and nLeftFrame ~= 0 and nQuestIndex and player.GetQuestValue(nQuestIndex, 1) ~= 1 then
		if not player.GetQuestFailedFlag(nQuestIndex) then
			player.SetQuestFailedFlag(nQuestIndex, 1)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com