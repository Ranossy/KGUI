---------------------------------------------------
-- 脚本文件：scripts\skill\Quest\恶人谷_毒功的代价一.lua
---------------------------------------------------

local nQuestID = 191

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 0, 0)
	end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com