---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_百花拂穴手_兰摧玉折.lua
-- 更新时间:	2013/6/7 23:25:39
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_点穴截脉_兰摧玉折.lua
-- 创建人    :  南剑	
-- 创建时间  :  2008-8-12
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  吟唱技能
-- 武功套路  :  点穴截脉
-- 技能名称  :  兰摧玉折
-- 技能效果  :  远程中性持续内伤，持续15秒，若被解除将立刻吞噬全部持续中性内伤剩余时间伤害，并被点穴定身3秒——吞dot效果未实现
------------------------------------------------
 
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 111}, --level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 143}, --level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 175}, --level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 207}, --level 4
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 239}, --level 5
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 263},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		6371, -- 属性值1
		1																	-- 属性值2
		);
	--]]
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(nType, dwBuffID, nStackNum)		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(nType, dwBuffID, nStackNum)		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1, 711, dwSkillLevel)			-- 设置Buff
	skill.BindBuff(2, 8490, 1);		-- 设置Debuff
	--skill.BindDebuff(nDebuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindDot(nDotID, nDotLevel);				-- 设置Dot
	--skill.BindHot(nHotID, nHotLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	--skill.SetNormalCoolDown(1, 181);
	--skill.SetCheckCoolDown(1, 444);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
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
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 28 + 48 * 0.9 * 1.25 * 1.15;
	elseif dwSkillLevel < 19 then
		skill.nChannelInterval = 28 + (48 + (dwSkillLevel - 9) * 9) * 0.9 * 1.25 * 1.15
	else
		skill.nChannelInterval = 28 + 155 * 0.9 * 1.25 * 1.15;     -- 通道技间隔时间
	end
	
	--skill.nChannelInterval = 155; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 85;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=
    
	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = 0*PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com