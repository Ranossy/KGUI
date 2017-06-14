---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_灵魂状态标记BUFF.lua
-- 更新时间:	2016/6/27 15:37:56
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")
--每跳涨经验，扣体力
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end

	--小攻防准备时间，此活动从小攻防前一小时开始，到小攻防结束时结束，直接判断这个就行
	if CastleFight.CheckPrepareTime() then	
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1926), 5)
			player.SendSystemMessage(GetEditorString(10, 1926))
			player.DelBuff(10827, 1)
			if player.GetBuff(11494, 1) then
				player.DelBuff(11494, 1) --删除方士半透明buff
			end
			return
		end
	end
	local nLimitStamina = 2     --每跳（分）消耗的精力，没有精力就删除BUFF
	local nAddExp = 4         --与消耗精力对应的经验
	local nCurrentStamina = player.nCurrentStamina
	if nCurrentStamina < nLimitStamina then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1442), 3)
		player.SendSystemMessage(GetEditorString(10, 1442))
		player.DelBuff(10827, 1)
		if player.GetBuff(11494, 1) then
			player.DelBuff(11494, 1) --删除方士半透明buff
		end
		return
	end
	player.AddStamina( - nLimitStamina)
	player.SendSystemMessage(GetEditorString(10, 2199))
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	IdentifyManager.AddIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD, nAddExp)	--添加经验成功后，走UpdateIdentityLevel函数，如果升级则判断是否切换位面
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_还魂.lua", nCustomValue, 1)	--正不正常都走统一的结束流程
	--[[
		local scene = player.GetScene()
	if not scene then
		return
	end
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	local x = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1)
	local y = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5)
	local z = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9)
	local mapID = IdentifyManager.GetCustomInteger2(3, 13)
	local nLimitStamina = 2
	if scene.dwMapID == mapID or player.nCurrentStamina < nLimitStamina then    --正不正常都走统一的结束流程
		if x > 0 and y > 0 and z > 0 then
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_还魂.lua", nCustomValue, 1)	--正常结束的回魂
		end
	end
	--]]
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com