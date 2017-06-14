------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2009-03-24
-- 效果备注	:  万花场景用道具技能回调脚本
------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")
Include("scripts/Include/Npc.lh")

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 176
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	
	local nQuestID1 = 8249
	local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
	local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
	if nQuestIndex then 	
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 1 then
			if player.GetQuestValue(nQuestIndex, 1) < 1 then
				player.SetQuestValue(nQuestIndex, 1, 1)
			end
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 4 then
			if Random(10) <= 6 then
				if player.GetQuestValue(nQuestIndex, 1) < 1 then
					player.SetQuestValue(nQuestIndex, 1, 1)
				end
			end
		end
	end 
	
	if nQuestIndex1 then 
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 1 then
			if player.GetQuestValue(nQuestIndex1, 1) < 1 then
				player.SetQuestValue(nQuestIndex1, 1, 1)
			end
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 4 then
			if Random(10) <= 6 then
				if player.GetQuestValue(nQuestIndex1, 1) < 1 then
					player.SetQuestValue(nQuestIndex1, 1, 1)
				end
			end
		end
	end 
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com