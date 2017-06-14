------------------------------------------------
--skill\Quest\双倍经验添加.lua
------------------------------------------------


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	--[[local tOldDoubleBuffID =  {
		355, 1289, 1290, 1435, 1587, 1591, 
		1620, 1627, 1703, 2070, 2558, 1262
	} 
	local dwNewBuffID = 2864  --时间积累的新BUFFID
	local nYanchangTiao = 1--]]
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/双倍经验添加.lua", 0, 0)
	--[[for k, v in pairs(tOldDoubleBuffID) do
		local buff = player.GetBuff(v, 0)
		if not buff then
			print(k, v)
		end
		if buff then
			if v == 1262 then	-- 师门打坐双倍处理
				nYanchangTiao = nYanchangTiao + math.floor(((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60) / 5) * buff.nStachNum
			else
				nYanchangTiao = nYanchangTiao + math.floor((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60)  --老BUFF的剩余时间，单位分
			end
			player.DelBuff(v, 0)
		end
	end

	player.AddBuff(0, 99, dwNewBuffID, 1, nYanchangTiao)--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

local tOldDoubleBuffID =  {
	355, 1289, 1290, 1435, 1587, 1591, 
	1620, 1627, 1703, 2070, 2558, 1262
}
local strign_DoubleExpBuffExchange = GetEditorString(6, 7617)
local dwNewBuffID = 2864  --时间积累的新BUFFID
function OnTimer(player, nParam1, nParam2)
	local nYanchangTiao = 1
	for k, v in pairs(tOldDoubleBuffID) do
		local buff = player.GetBuff(v, 0)
		if buff then
			if v == 1262 then	-- 师门打坐双倍处理
				nYanchangTiao = nYanchangTiao + math.floor(((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60) / 5) * buff.nStackNum
			else
				nYanchangTiao = nYanchangTiao + math.floor((buff.GetEndTime() - GetLogicFrameCount()) / 16 / 60)  --老BUFF的剩余时间，单位分
			end
			player.DelBuff(v, buff.nLevel)
		end
	end

	--local nFlagBuffID = 8194
	--local nFlagBuffLevel = 1
	--local buff_Flag = player.GetBuff(nFlagBuffID, nFlagBuffLevel)		-- 隐藏的标记Buff
	--if buff_Flag then
	if	player.bNewFarmerFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", strign_DoubleExpBuffExchange, 4)
		player.SendSystemMessage(strign_DoubleExpBuffExchange)
		return
	end
	
	player.AddBuff(0, 99, dwNewBuffID, 1, nYanchangTiao)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com