---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/世界规则/双倍经验Buff工作室判断.lua
-- 更新时间:	2014/8/15 16:16:03
-- 更新用户:	zhengkaifeng
-- 脚本说明:
----------------------------------------------------------------------<

-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nBuffID = 2864
	local nBuffLevel = 1
	local nFlagBuffID = 8194
	local nFlagBuffLevel = 1

	local buff = player.GetBuff(nBuffID, nBuffLevel)		-- 双倍经验Buff
	if not buff then
		return
	end
	
	local buff_Flag = player.GetBuff(nFlagBuffID, nFlagBuffLevel)		-- 隐藏的标记Buff
	if player.bNewFarmerFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 7617), 4)
		player.SendSystemMessage(GetEditorString(6, 7618))
		player.DelBuff(nBuffID, nBuffLevel)		-- 清除剩余的双倍经验Buff
		return
	end

	if player.nLevel >= 20 and (player.bFarmerLimit or player.bNewFarmerFlag) then
		local nRate = Random(10000)
		if nRate <= 8000 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 7617), 4)
			player.SendSystemMessage(GetEditorString(6, 7618))
			player.DelBuff(nBuffID, nBuffLevel)		-- 清除剩余的双倍经验Buff
			player.AddBuff(0, 99, nFlagBuffID, nFlagBuffLevel, 1)		-- 添加隐藏的标记Buff
			return
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com