------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-9-5
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(6716, 1) then
		if player.GetBuff(6716, 1).nStackNum == 99 then
			player.Die()
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 267), 10)
			player.AcquireAchievement(3901)
		end	
		if player.nCurrentLife < player.nMaxLife * 0.01 * player.GetBuff(6716, 1).nStackNum then
			player.Die()
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 267), 10)
			player.AcquireAchievement(3901)
		else
			player.nCurrentLife = player.nCurrentLife - player.nMaxLife * 0.01 * player.GetBuff(6716, 1).nStackNum
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com