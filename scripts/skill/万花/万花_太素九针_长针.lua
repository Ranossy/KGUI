---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_长针.lua
-- 更新时间:	2013/6/20 23:17:18
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_太素九针_长针.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2008-08-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  
-- 武功套路  :  太素九针
-- 技能名称  :  长针
-- 技能效果  :  直接大治疗
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nTherapyBase = 503, nTherapyRand = 50, nCostMana = 199 * 0.9},
	{ nTherapyBase = 539, nTherapyRand = 54, nCostMana = 294 * 0.9},
	{ nTherapyBase = 575, nTherapyRand = 58, nCostMana = 370 * 0.9},
	{ nTherapyBase = 611, nTherapyRand = 61, nCostMana = 442 * 0.9},
	{ nTherapyBase = 647, nTherapyRand = 65, nCostMana = 518 * 0.9},
	{ nTherapyBase = 683, nTherapyRand = 68, nCostMana = 591 * 0.9},
	{ nTherapyBase = 719, nTherapyRand = 72, nCostMana = 591 * 0.9},
	{ nTherapyBase = 755, nTherapyRand = 76, nCostMana = 591 * 0.9},
	{ nTherapyBase = 791, nTherapyRand = 79, nCostMana = 199 * 0.9},
	{ nTherapyBase = 827, nTherapyRand = 83, nCostMana = 294 * 0.9},
	{ nTherapyBase = 863, nTherapyRand = 86, nCostMana = 370 * 0.9},
	{ nTherapyBase = 899, nTherapyRand = 90, nCostMana = 442 * 0.9},
	{ nTherapyBase = 935, nTherapyRand = 94, nCostMana = 518 * 0.9},
	{ nTherapyBase = 971, nTherapyRand = 97, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1007, nTherapyRand = 101, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1043, nTherapyRand = 104, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1079, nTherapyRand = 108, nCostMana = 199 * 0.9},
	{ nTherapyBase = 1115, nTherapyRand = 112, nCostMana = 294 * 0.9},
	{ nTherapyBase = 1151, nTherapyRand = 115, nCostMana = 370 * 0.9},
	{ nTherapyBase = 1187, nTherapyRand = 119, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1223, nTherapyRand = 122, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1259, nTherapyRand = 126, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1295, nTherapyRand = 130, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1331, nTherapyRand = 133, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1367, nTherapyRand = 137, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1403, nTherapyRand = 140, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1439, nTherapyRand = 144, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1475, nTherapyRand = 148, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1511, nTherapyRand = 150, nCostMana = 591 * 0.9},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
   	
	----------------- 魔法属性 -------------------------------------------------
	--施放 子技能_万花治疗阵法第五重
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		108,
		1
	);
   	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1587,										
--		1
--	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 清瞬发buff
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		6266,
		1																
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3038,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_太素九针_长针.lua",
		0
	);	

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(1, 592, 1);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444)
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 420*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 420*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 420*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 420*0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 420;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 56;				-- 吟唱帧数
	skill.nChannelInterval = 173; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID)  then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--通用删除瞬发buff
	if player.GetBuff(412, 1) then
		--删水月
		player.DelBuff(412, 1)
	elseif player.GetBuff(932, 1) then
		--删阵法迅涌
		player.DelBuff(932, 1)
	elseif player.GetBuff(6266, 1) then
		player.DelBuff(6266,1)
	end
	
	local lv = player.GetSkillLevel(142)

	--长针给目标小队溅射握针hot
	if player.GetSkillLevel(14659) == 1 then
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 then
			local nbuff_wozhen = target.GetBuffByOwner(631, nlev, player.dwID)
			if nbuff_wozhen then
				player.CastSkill(14660, nlev, player.GetSkillTarget())
			end
		end
	end

	--长针溅射AOE
	if player.GetSkillLevel(5776) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5669, 1)
		player.CastSkillXYZ(6103, lv, target.nX, target.nY, target.nZ)
		--player.PlaySfx(478, target.nX, target.nY, target.nZ + 500)
		player.PlaySfx(477, target.nX, target.nY, target.nZ)
	end

	--长针叠加速
	if player.GetSkillLevel(5786) == 1 then
		--player.AddBuff(dwCharacterID, player.nLevel, 6253, 1, 1)
		--if player.GetBuff(6253, 1).nStackNum == 5 then
		if not player.GetBuff(6252, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 10739, 1, 1)
			--player.AddBuff(dwCharacterID, player.nLevel, 6252, 1, 1)
		end
		--end
	end

	--长针附带春泥
	local lv1 = player.GetSkillLevel(132)	--春泥
	if player.GetSkillLevel(5789) == 1 then
		if not target.GetBuff(6415, 1) then
			if not target.GetBuff(7734,1) then
				if player.GetSkillLevel(5779) == 1 then
					target.AddBuff(player.dwID, player.nLevel, 6264, lv1, 1)	--加强春泥
				else
					target.AddBuff(player.dwID, player.nLevel, 122, lv1, 1)		--正常春泥
				end
			end
			target.AddBuff(player.dwID, player.nLevel, 6415, 1, 1)	--2秒内置CD
		end
	end
	--player.DelBuff(6266, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com