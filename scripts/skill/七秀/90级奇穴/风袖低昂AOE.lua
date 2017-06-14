---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/风袖低昂AOE.lua
-- 更新时间:	2013/6/2 2:40:44
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_霓裳羽衣_王母挥袂_正常.lua
-- 创建人    :  张豪	
-- 创建时间  :  2011-04-16
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  
-- 武功套路  :  霓裳羽衣
-- 技能名称  :  王母挥袂
-- 技能效果  :  远程大单体治疗，需要剑舞状态
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 280, nTherapy = 238*0.95, nTherapyRand = 238*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 253*0.95, nTherapyRand = 253*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 268*0.95, nTherapyRand = 268*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 283*0.95, nTherapyRand = 283*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 298*0.95, nTherapyRand = 298*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 313*0.95, nTherapyRand = 313*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 328*0.95, nTherapyRand = 328*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 343*0.95, nTherapyRand = 343*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 358*0.95, nTherapyRand = 358*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 373*0.95, nTherapyRand = 373*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 388*0.95, nTherapyRand = 388*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 403*0.95, nTherapyRand = 403*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 418*0.95, nTherapyRand = 418*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 433*0.95, nTherapyRand = 433*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 448*0.95, nTherapyRand = 448*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 463*0.95, nTherapyRand = 463*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 478*0.95, nTherapyRand = 478*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 493*0.95, nTherapyRand = 493*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 508*0.95, nTherapyRand = 508*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 523*0.95, nTherapyRand = 523*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 538*0.95, nTherapyRand = 538*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 553*0.95, nTherapyRand = 553*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 568*0.95, nTherapyRand = 568*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 583*0.95, nTherapyRand = 583*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 598*0.95, nTherapyRand = 598*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 613*0.95, nTherapyRand = 613*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 628*0.95, nTherapyRand = 628*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 643*0.95, nTherapyRand = 643*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 658*0.95, nTherapyRand = 658*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 673*0.95, nTherapyRand = 673*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 688*0.95, nTherapyRand = 688*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 703*0.95, nTherapyRand = 703*0.1, }, --level 2
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6633,
		8
	);
    
	
    
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5796, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(1, 592, 1);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);					--公共CD1.5秒
	--skill.SetNormalCoolDown(1, 441);					--自身CD15秒

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
    
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离 
	skill.nMaxRadius = 30 * LENGTH_BASE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 48;				-- 吟唱帧数
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 42;
 	elseif dwSkillLevel < 32 then
  		skill.nChannelInterval = 42 + (dwSkillLevel - 9) * 2
  	else
  		skill.nChannelInterval =95;     -- 通道技间隔时间   
 	end
	--skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数 
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
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com