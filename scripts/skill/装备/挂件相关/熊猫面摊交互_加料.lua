---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/熊猫面摊交互_加料.lua
-- 更新时间:	2016/2/20 15:22:10
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/熊猫面摊交互_加料.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 1027);

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --增加限时版的判断处理
		return false
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if not npc then
		player.SendSystemMessage(GetEditorString(9, 8870))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8870), 4)
		return
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --增加限时版的判断处理
		return
	end

	if player.dwModelID ~= 0 then -- 检查是不是换装了
		return
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return
	end

	if player.bFightState then
		return
	end

	if player.bOnHorse then
		return
	end

	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if not npc then
		player.SendSystemMessage(GetEditorString(9, 8871))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8871), 4)
		return
	end

	-----判断玩家身上的CD buff----- 
	local buff_CD = player.GetBuff(10506, 0)
	
	local nValueZ = 400
	
	local nA_xm1 = -10 --相对偏移角度
	local nL_xm1 = 0.5 * 64 --相对偏移距离
	local nH1 = ((npc.nFaceDirection + nA_xm1) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT1 = npc.nX + nL_xm1 * math.cos(nH1)
	local dwY_POINT1 = npc.nY + nL_xm1 * math.sin(nH1)

	local nA_xm2 = 45 --相对偏移角度
	local nL_xm2 = 0.9 * 64 --相对偏移距离
	local nH2 = ((npc.nFaceDirection + nA_xm2) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT2 = npc.nX + nL_xm2 * math.cos(nH2)
	local dwY_POINT2 = npc.nY + nL_xm2 * math.sin(nH2)
	
	if buff_CD and buff_CD.nStackNum == 2 then
		player.SendSystemMessage(GetEditorString(9, 8874))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8875), 4)
		return
	elseif buff_CD and buff_CD.nStackNum == 1 then
		
		local nBuff_id = 10506
		local nBuff_lv = 1
		AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)

		local doodad1 = scene.GetDoodadByNickName("mw1_fxf" .. player.dwID)
		local newdoodad1 = nil
		if doodad1 then
			scene.DestroyDoodad(doodad1.dwID)
			newdoodad1 = scene.CreateDoodad(6013, dwX_POINT1, dwY_POINT1, npc.nZ + nValueZ, npc.nFaceDirection, "mw1_fxf" .. player.dwID)
			--功夫面
		else
			newdoodad1 = scene.CreateDoodad(6013, dwX_POINT1, dwY_POINT1, npc.nZ + nValueZ, npc.nFaceDirection, "mw1_fxf" .. player.dwID)	--功夫面
		end
		newdoodad1.SetCustomUnsigned4(0, npc.dwID)
		player.SendSystemMessage(GetEditorString(9, 8876))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8876), 4)
		return
	else
	
		local nBuff_id = 10506
		local nBuff_lv = 1
		AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)

		local doodad2 = scene.GetDoodadByNickName("mw2_fxf" .. player.dwID)
		local newdoodad2 = nil
		if doodad2 then
			scene.DestroyDoodad(doodad2.dwID)
			newdoodad2 = scene.CreateDoodad(6013, dwX_POINT2, dwY_POINT2, npc.nZ + nValueZ, npc.nFaceDirection, "mw2_fxf" .. player.dwID)	--功夫面
		else
			newdoodad2 = scene.CreateDoodad(6013, dwX_POINT2, dwY_POINT2, npc.nZ + nValueZ, npc.nFaceDirection, "mw2_fxf" .. player.dwID)	--功夫面
		end
		newdoodad2.SetCustomUnsigned4(0, npc.dwID)
		player.SendSystemMessage(GetEditorString(9, 8876))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8876), 4)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)
	--===========================================================================		
	local buff_x = player.GetBuff(nBuff_id, nBuff_lv)
	
	local nCurrentTime = GetCurrentTime()
	local tTime = TimeToDate(nCurrentTime)
	local nLineTime = DateToTime(tTime.year, tTime.month, tTime.day + 1, 7, 0, 0)           --第二天7点的时间值
	local nLineTime2 = DateToTime(tTime.year, tTime.month, tTime.day, 7, 0, 0)              --当天7点的时间值
	local nLastTime = 1
	if nCurrentTime > nLineTime2 then
		nLastTime = nLineTime - nCurrentTime                                                  --现在和下个整点零7分的时间差
	else
		--如果小于7点，则加到今天7点
		nLastTime = nLineTime2 - nCurrentTime   
	end
		
	if buff_x then
		if buff_x.nStackNum < 2 then
			player.AddBuff(0, 99, nBuff_id, nBuff_lv, nLastTime)
		end
	else
		player.AddBuff(0, 99, nBuff_id, nBuff_lv, nLastTime)
	end
	--===========================================================================
end

--function GetPoint_xyf(nX,nY,nF,nA,nL)
	--local nA_xm1 = nA --相对偏移角度
	--local nL_xm1 = nL --相对偏移距离
	--local nH_xm1 = ((nF + nA) / 256 * 360) / 360 * 2 * math.pi
	--local nX_New = nX + (nL_xm1) * math.cos(nH_xm1)
	--local nY_New = nY + (nL_xm1) * math.sin(nH_xm1)
	--local nF_New = nF
	--return nX_New,nY_New,nF_New
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com