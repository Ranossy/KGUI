---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_国色天香.lua
-- 更新时间:	2013/6/2 18:27:28
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2011-04-16
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	--友方治疗无奇穴
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2983,
		dwSkillLevel
	);

	--友方治疗有奇穴无buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16859,
		dwSkillLevel
		);
	--友方治疗有奇穴有翔舞
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16860,
		dwSkillLevel
	);
	--友方治疗有奇穴上元
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16861,
		dwSkillLevel
		);
	--友方治疗有奇穴有上元有翔舞
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		16862,
		dwSkillLevel
	);

	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2984,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/霓裳羽衣_国色天香.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
		-1, -- 属性值1
		0														-- 属性值2
		);
	for i = 1, 3 do
		skill.AddAttribute(														--70橙武技能
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
			6213,
			i
			);
	end
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	--skill.bIgnorePrepareState = true
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2831, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff
	
	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetCheckCoolDown(1, 444);
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= 704;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	if dwSkillLevel <= 4 then
		skill.nCostManaBasePercent = 674*0.8*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 8 then
		skill.nCostManaBasePercent = 674*0.8*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 674*0.8 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 674*0.8 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 674*0.8;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	skill.nMinChannelInterval = 1;-- 通道技间隔时间 
	skill.nChannelInterval = 8; 				-- 通道技间隔时间 
	skill.nChannelFrame = 40;	 			-- 通道技持续时间，单位帧数
	skill.nMinChannelFrame = 1
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
	for i = 1, 7 do
		if player.GetBuff(409, i) then
			return nPreResult
		end
	end
	return SKILL_RESULT_CODE.BUFF_ERROR
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(dwCharacterID, player.nLevel, 6231, 1, 1)
	local buff = player.GetBuff(6231, 1)
	--[[
	if buff.nStackNum == 5 then
		if player.GetSkillLevel(5884) == 1 then

			local nRnd = Random(1, 10000)
			if nRnd <= 3000 then
				player.CastSkill(9010, 1)
			end
		end
		player.DelGroupBuff(6231, 1)
	end
	--]]
	
	local i = Random(1, 100)
	if player.GetSkillLevel(5891) == 1 then
		if	i <= 3 then
			player.ClearCDTime(185)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com