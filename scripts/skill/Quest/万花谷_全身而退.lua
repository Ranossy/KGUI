----------------------------------------------
-- 脚本文件：client\scripts\skill\Quest\万花谷_全身而退.lua
----------------------------------------------

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
		if IsPlayer(nCharacterID) then
				local player = GetPlayer(nCharacterID)
				if player then
					local nQuestID = 3019
					local nQuestIndex = player.GetQuestIndex(nQuestID)
					if player.GetQuestPhase(nQuestID) == 1 and nQuestIndex and player.nCurrentLife == 1 then
						player.SetQuestFailedFlag(nQuestIndex, 1)
					end
				end
		end		
end	

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com