---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/新手村改造/董龙_震地空掌_触发眩晕.lua
-- 更新时间:	2016/8/18 15:43:04
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 873
	if not player.GetQuestIndex(nQuestID) or player.GetQuestPhase(nQuestID) ~= 1 then --这俩任务只要有一个没完成，就要执行下去
		nQuestID = 15587
	end
	if player then
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		if nQuestPhase == 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.SetKillNpcCount(nQuestIndex, 0, 5)
			player.SetKillNpcCount(nQuestIndex, 1, 2)
			player.Stop()
			player.AddBuff(0, 99, 1736, 1)
			local tText = {
				GetEditorString(2, 6694),
				GetEditorString(2, 6692),
				"",
				GetEditorString(2, 6690),
				GetEditorString(2, 6691),
				"",
				GetEditorString(2, 6693),
			}
			RemoteCallToClient(player.dwID, "StartFilterMask", 60, 70, 130, {0, 0, 0}, false, true, tText)
		end
	end
--触发事件：
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com