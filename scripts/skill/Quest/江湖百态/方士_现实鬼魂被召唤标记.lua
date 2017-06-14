---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_现实鬼魂被召唤标记.lua
-- 更新时间:	2016/7/8 21:42:14
-- 更新用户:	wangwei2
-- 脚本说明:   即使灵魂世界的鬼魂消失，也不影响正在化形的鬼魂
----------------------------------------------------------------------<
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")
function Apply(dwCharacterID, dwSkillSrcID)	
	local new_ghost = GetNpc(dwCharacterID)
	if not new_ghost then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		new_ghost.SetDisappearFrames(1)		
		return
	end
	local scene = player.GetScene()
	if not scene then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		new_ghost.SetDisappearFrames(1)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 2292), 3)
		player.SendSystemMessage(GetEditorString(10, 2293))
		return
	end
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame ~= 0 then
		return
	end
	local new_ghost = GetNpc(nCharacterID)
	if not new_ghost then
		return
	end	
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		new_ghost.SetDisappearFrames(1)		
		return
	end
	local scene = player.GetScene()
	if not scene then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		new_ghost.SetDisappearFrames(1)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 2292), 3)
		player.SendSystemMessage(GetEditorString(10, 2293))
		return
	end
	new_ghost.DoAction(0, 10063)
	Identity_LonelyGhostSummon(fazhen, player, new_ghost) 
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com