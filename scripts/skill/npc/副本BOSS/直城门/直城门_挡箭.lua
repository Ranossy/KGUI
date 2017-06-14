------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-10-7
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not player then
		return
	end
	if (player.nX > 14529 and player.nX < 19351  and player.nY > 15031 and player.nY < 24626) or (player.nX > 14084 and player.nX < 19538 and player.nY > 40980 and player.nY < 51171) then
		if player.nMoveState == MOVE_STATE.ON_RUN or player.nMoveState == MOVE_STATE.ON_WALK then
			if not player.GetBuff(6930, 1) then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_YELLOW", GetEditorString(6, 820), 1)
			end
			local tPlayer = scene.GetAllPlayer()
			for i = 1, #tPlayer do
				local CPlayer = GetPlayer(tPlayer[i])
				if CPlayer and CPlayer.dwID ~= player.dwID then
					RemoteCallToClient(CPlayer.dwID, "OnOutputWarningMessage", "MSG_WARNING_YELLOW", GetEditorString(6, 934), 1)
				end
			end
			if not player.GetBuff(6929, 1) then
				player.AddBuff(0, 99, 6929, 1)
			end
		end
	end	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com