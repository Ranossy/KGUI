----------------------------------------------
-- 脚本文件：洛道\skill\捉神策玩家时间到.lua
----------------------------------------------
-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)


end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)

	local nQuestID = 988
	
	
	local player = GetPlayer(dwCharacterID)

	local QuestIndex = player.GetQuestIndex(nQuestID)
	
	player.SetQuestValue(QuestIndex,1,0)
	
end	

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com