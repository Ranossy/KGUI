----------------------------------------------
-- 脚本文件：金水镇\skill\通缉任务_代.lua
----------------------------------------------
-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
--function Apply(dwCharacterID)
--end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if IsPlayer(nCharacterID) then
		if nLeftFrame == 0 then
		else
			local nQuestID = 1709
			local player = GetPlayer(nCharacterID)
			if player then
				if player.GetQuestPhase(nQuestID) == 1 then
					local nQuestIndex = player.GetQuestIndex(nQuestID)
					if player.GetQuestValue(nQuestIndex, 0) ~= 1 then
						if not player.GetQuestFailedFlag(nQuestIndex) then
							player.SetQuestFailedFlag(nQuestIndex, 1)
						end
					end
				end
			end
		end
	end
end	

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com