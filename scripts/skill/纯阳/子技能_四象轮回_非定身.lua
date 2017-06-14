---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/子技能_四象轮回_非定身.lua
-- 更新时间:	2013/6/22 16:37:36
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2009-03-12
-- 效果备注	:  四象轮回子技能_在目标非定身时施放成功
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 29, nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 40, nDamageRand = 5}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 50, nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 60, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 69, nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 76, nDamageRand = 5}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 81, nDamageRand = 5}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 83, nDamageRand = 5}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 85, nDamageRand = 5}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 87, nDamageRand = 5}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 90, nDamageRand = 5}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 95, nDamageRand = 5}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 100, nDamageRand = 5}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 105, nDamageRand = 10}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 10}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 115, nDamageRand = 10}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 120, nDamageRand = 10}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 125, nDamageRand = 10}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 130, nDamageRand = 10}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 135, nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 144, nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 148, nDamageRand = 15}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 152, nDamageRand = 15}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, nDamageRand = 15}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 160, nDamageRand = 20}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 162, nDamageRand = 20}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 164, nDamageRand = 20}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 166, nDamageRand = 20}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 172, nDamageRand = 20}, -- Level 31 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 176, nDamageRand = 20}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 180, nDamageRand = 20}, -- Level 33
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 混元伤害
		tSkillData[dwSkillLevel].nDamageBase, -- 属性值1
		0																-- 属性值2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 混元伤害浮动值
		tSkillData[dwSkillLevel].nDamageRand, -- 属性值1
		0																-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- Call混元伤害
		0, -- 属性值1
		0																-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 聚气
		2, -- 1格
		0																-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/子技能_四象轮回_非定身.lua", -- 连协技
		0
		);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2086, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1, 555, 1);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 431);	

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	if dwSkillLevel < 8 then
		skill.nChannelInterval = 32*1.1*1.1*0.95;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (32 + (dwSkillLevel - 7) * 5)*1.1*1.1*0.95
	else
		skill.nChannelInterval = 170*1.1*1.1*0.95;     -- 通道技间隔时间   
	end
	

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
	
	--Skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if player.GetBuff(10078, 1) then
		player.DelBuff(10078, 1)
	end
	
	--四象几率锁足
	local i = Random(1, 100)
	if i <= 25 then 
		if player.GetSkillLevel(5824) == 1 then
			player.CastSkill(6090, 1)
		end
	end

	
	if player.nAccumulateValue >= 10 then
		player.AddBuff(dwCharacterID, player.nLevel, 6422, 1, 1)
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	--local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--if player.GetSkillLevel(5840) == 1 then
	if player.IsSkillRecipeActive(90, 1) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6374, 1, 1)
	end
	if player.GetSkillLevel(5840) == 1 then
		if player.IsSkillRecipeActive(90, 1) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 555, 3, 1)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 555, 2, 1)
		end
	end
	if player.GetSkillLevel(6797) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6351, 1, 1)
	end
	local f = Random(1, 100)
	if f <= 20 then
		if player.GetSkillLevel(6910) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6425, 1, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com