------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
   	skill.AddAttribute(
   			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
   			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		--	"skill/npc/副本BOSS/法王窟/法王窟_青翼蝠王_音波功.lua",								--属性值1
   			"skill/npc/副本BOSS/龙渊泽/龙渊泽_神策狗男女_男_技能1(母技能).lua",
   			0															--属性值2
	  );
   	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- 属性作用模式
   		ATTRIBUTE_TYPE.nAttributeKey,								-- 魔法属性
   		nAttributeValue1,											-- 属性值1
   		nAttributeValue2											-- 属性值2
   		);
    --]]
    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    -- 公共CD
    --skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
    -- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
    --skill.nCostStamina	= 0;									-- 技能消耗的体力
    --skill.nCostItemType	= 0;									-- 技能消耗的物品类型
    --skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
    
    ----------------- 聚气相关 -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- 技能是否需要聚气
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- 链状技能相关 ---------------------------------------------
    --skill.nChainBranch	= 1;					--链状技能分支数
    --skill.nChainDepth		= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    ----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 4 * LENGTH_BASE;		-- 技能作用半径 
    --skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
    ----------------- 阵法相关 -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- 是否阵眼技能
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
    --skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
    ----------------- 目标血量需求 ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 自身血量需求 ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=
    
    ----------------- 打退打断落马相关 -------------------------------------------------
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
    return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

function FxFindTarget(cTarget, nType)
	local pTargetType, pTargetID = cTarget.GetTarget()
	if pTargetType == nType then
		if pTargetType == TARGET.PLAYER then
			local cPlayer = GetPlayer(pTargetID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				return cPlayer
			end
		elseif pTargetType == TARGET.NPC then
			local cNpc = GetNpc(pTargetID)
			if cNpc then
				return cNpc
			end
		end
	elseif nType == 0 then
		if pTargetType == TARGET.PLAYER then
			local cPlayer = GetPlayer(pTargetID)
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				return cPlayer
			end
		elseif pTargetType == TARGET.NPC then
			local cNpc = GetNpc(pTargetID)
			if cNpc then
				return cNpc
			end
		end
	else
		return false
	end
end

function Fx_TargetAngle(npc, Target)
	local xxNpc_2D_X = npc.nX - Target.nX
	local xxNpc_2D_Y = npc.nY - Target.nY
	local xxNpc_3D_X = math.sqrt(xxNpc_2D_X ^ 2 + xxNpc_2D_Y ^ 2)
	local xxNpc_Angle = math.deg(math.asin(math.abs(xxNpc_2D_X) / math.abs(xxNpc_3D_X)))
	if xxNpc_2D_X < 0 and xxNpc_2D_Y < 0 then
		xxNpc_Angle = 90 - xxNpc_Angle
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y <= 0 then
		xxNpc_Angle = xxNpc_Angle + 90
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = 90 - xxNpc_Angle + 180
	elseif xxNpc_2D_X <= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = xxNpc_Angle + 270
	end
	return math.floor(xxNpc_Angle / 360 * 255)
end
-----------------------------------------------------------
function FightAreaLimit_Square(cTarget, tArea, bArea)
	if bArea == nil then
		bArea = true
	end
	local x, y = cTarget.nX, cTarget.nY
	local xMax = 0
	local xMin = 0
	local yMax = 0
	local yMin = 0
	if tArea[1] > tArea[3] then
		xMax = tArea[1]
		xMin = tArea[3]
	else
		xMax = tArea[3]
		xMin = tArea[1]
	end
	if tArea[2] > tArea[4] then
		yMax = tArea[2]
		yMin = tArea[4]
	else
		yMax = tArea[4]
		yMin = tArea[2]
	end
	if x > xMax or x < xMin or y > yMax or y < yMin then
		if IsPlayer(cTarget.dwID) and bArea then
			cTarget.AddBuff(0, 99, 2685, 1)
			cTarget.AddBuff(0, 99, 2684, 1)
		end
		return false		--区域外
	else
		if IsPlayer(cTarget.dwID) and bArea then
			local xInMax = xMax - (6 * 64)
			local xInMin = xMin + (6 * 64)
			local yInMax = yMax - (6 * 64)
			local yInMin = yMin + (6 * 64)
			if x > xInMax or x < xInMin or y > yInMax or y < yInMin then
				cTarget.AddBuff(0, 99, 2684, 1)
			else
				cTarget.DelBuff(2684, 1)
			end
			cTarget.DelBuff(2685, 1)
		end
		return true		--区域内
	end
end

function FightAreaLimit_Circular(cTarget, tArea, bArea)
	if bArea == nil then
		bArea = true
	end
	local x, y = cTarget.nX, cTarget.nY
	local nPlayerSpace = math.sqrt((x - tArea[1]) ^ 2 + (y - tArea[2]) ^ 2)
	local nLimit = math.sqrt((tArea[3] - tArea[1]) ^ 2 + (tArea[4] - tArea[2]) ^ 2)
	if nPlayerSpace > nLimit then
		if IsPlayer(cTarget.dwID) and bArea then
			cTarget.AddBuff(0, 99, 2685, 1)
			cTarget.AddBuff(0, 99, 2684, 1)
		end
		return false
	else
		if IsPlayer(cTarget.dwID) and bArea then
			local nInLimit = nLimit - (6 * 64)
			if nPlayerSpace > nInLimit then
				cTarget.AddBuff(0, 99, 2684, 1)
			else
				cTarget.DelBuff(2684, 1)
			end
			cTarget.DelBuff(2685, 1)
		end
		return true
	end
end

function FightAreaLimit_Z(cTarget, tArea)
	local z = cTarget.nZ
	if z > (tArea[1] + tArea[2]) or z < (tArea[1] - tArea[2]) then
		return false
	else
		return true
	end
end

function Fx_AllPlayer(scene)
	if scene.nType ~= MAP_TYPE.DUNGEON then
		return false
	end
	local tTatget = {}
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = GetPlayer(tPlayer[i])
			if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget
		end
	end
end
-----------------------------------------------------------
function Fx_RandomTargetInArea(scene, nType, tArea)
	local tTatget = {}
	local tPlayer = Fx_AllPlayer(scene)
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = tPlayer[i]
			local bIn = false
			if nType == 1 then
				bIn = FightAreaLimit_Square(cPlayer, tArea)
			elseif nType == 2 then
				bIn = FightAreaLimit_Circular(cPlayer, tArea)
			elseif nType == 3 then
				bIn = FightAreaLimit_Z(cPlayer, tArea)
			end
			if bIn then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget[Random(1, #tTatget)]
		end
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene then
			local Lv = 1
			if scene.dwMapID == 118 then
				Lv = 2
			elseif scene.dwMapID == 119 then
				Lv = 3
			elseif scene.dwMapID == 117 then
				Lv = 4
			end
			local npcBossWoman = scene.GetNpcByNickName("Boss_1_Woman")
			if npcBossWoman then
				local cPlayer = FxFindTarget(npcBossWoman, TARGET.PLAYER)
				if cPlayer then
					npc.TurnTo(Fx_TargetAngle(npc, cPlayer))
					npc.CastSkill(2791, Lv, TARGET.PLAYER, cPlayer.dwID)
					npc.SetCustomUnsigned4(10, cPlayer.dwID)
				else
					local tArea = {npc.nX, npc.nY, npc.nX + (64 * 30), npc.nY + (64 * 30)}
					cPlayer = Fx_RandomTargetInArea(scene, 2, tArea)
					if cPlayer then
						npc.TurnTo(Fx_TargetAngle(npc, cPlayer))
						npc.CastSkill(2791, Lv, TARGET.PLAYER, cPlayer.dwID)
						npc.SetCustomUnsigned4(10, cPlayer.dwID)
					end
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com