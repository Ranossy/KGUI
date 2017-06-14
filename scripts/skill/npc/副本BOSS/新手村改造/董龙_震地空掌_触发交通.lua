---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/新手村改造/董龙_震地空掌_触发交通.lua
-- 更新时间:	2016/8/13 20:44:58
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene.dwMapID == 1 then
		local nQuest = 873
		local nQuestIndex = player.GetQuestIndex(nQuest)
		if nQuestIndex then
			player.SetQuestValue(nQuestIndex, 2, 1)
		end
		player.AddBuff(0, 99, 1899, 1, 54)
		if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 67, false)
		elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 8, false)
		else
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 68, false)
		end
		if player.GetBuff(1160, 1) then
			player.DelBuff(1160, 1)
		end
		player.SetTimer(50 * GLOBAL.GAME_FPS, "scripts/Map/稻香村/event/董龙交通延迟处理.lua", 0, player.dwID)--触发事件：
	end
	--播放新轻功CG
	--RemoteCallToClient(player.dwID, "OnPlayerUIMovie", "ui/Video/thirdmovie.mp4", 5, true)

	if scene.dwMapID == 247 then
		local nQuest = 15587
		local nQuestIndex = player.GetQuestIndex(nQuest)
		if nQuestIndex then
			player.SetQuestValue(nQuestIndex, 2, 1)
		end
		if player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 67, false)
		elseif player.nRoleType == ROLE_TYPE.STANDARD_MALE then
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 8, false)
		else
			RemoteCallToClient(player.dwID, "OnPlayProtocolMovie", 68, false)
		end
		if player.GetBuff(1160, 1) then
			player.DelBuff(1160, 1)
		end
		player.SetTimer(50 * GLOBAL.GAME_FPS, "scripts/Map/梦回稻香/event/董龙交通延迟处理.lua", 0, player.dwID)
	end

end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com