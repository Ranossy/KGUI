---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/镇派/提针对自身额外治疗效果.lua
-- 更新时间:	2014/7/2 9:15:32
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_太素九针_提针.lua
-- 创建人    :  吴娟
-- 创建时间  :  2008-08-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :
-- 武功套路  :  太素九针
-- 技能名称  :  提针
-- 技能效果  :  直接中治疗
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 207, nTherapyRand = 21, nCostMana = 65},
	{ nTherapyBase = 226, nTherapyRand = 23, nCostMana = 92},
	{ nTherapyBase = 245, nTherapyRand = 25, nCostMana = 112},
	{ nTherapyBase = 264, nTherapyRand = 26, nCostMana = 132},
	{ nTherapyBase = 283, nTherapyRand = 28, nCostMana = 152},
	{ nTherapyBase = 302, nTherapyRand = 30, nCostMana = 172},
	{ nTherapyBase = 321, nTherapyRand = 32, nCostMana = 192},
	{ nTherapyBase = 340, nTherapyRand = 34, nCostMana = 211},
	{ nTherapyBase = 359, nTherapyRand = 36, nCostMana = 211},
	{ nTherapyBase = 378, nTherapyRand = 38, nCostMana = 65},
	{ nTherapyBase = 397, nTherapyRand = 40, nCostMana = 92},
	{ nTherapyBase = 416, nTherapyRand = 42, nCostMana = 112},
	{ nTherapyBase = 435, nTherapyRand = 44, nCostMana = 132},
	{ nTherapyBase = 454, nTherapyRand = 45, nCostMana = 152},
	{ nTherapyBase = 473, nTherapyRand = 47, nCostMana = 172},
	{ nTherapyBase = 492, nTherapyRand = 49, nCostMana = 192},
	{ nTherapyBase = 511, nTherapyRand = 51, nCostMana = 211},
	{ nTherapyBase = 530, nTherapyRand = 53, nCostMana = 211},
	{ nTherapyBase = 549, nTherapyRand = 55, nCostMana = 65},
	{ nTherapyBase = 568, nTherapyRand = 57, nCostMana = 92},
	{ nTherapyBase = 587, nTherapyRand = 59, nCostMana = 112},
	{ nTherapyBase = 606, nTherapyRand = 61, nCostMana = 132},
	{ nTherapyBase = 625, nTherapyRand = 63, nCostMana = 152},
	{ nTherapyBase = 644, nTherapyRand = 64, nCostMana = 172},
	{ nTherapyBase = 663, nTherapyRand = 66, nCostMana = 192},
	{ nTherapyBase = 682, nTherapyRand = 68, nCostMana = 211},
	{ nTherapyBase = 701, nTherapyRand = 70, nCostMana = 211},
	{ nTherapyBase = 720, nTherapyRand = 72, nCostMana = 211},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyBase/3, --属性值1
		0							--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nTherapyRand/3, --属性值1
		0							--属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_THERAPY, -- 魔法属性
		0, --属性值1
		0							--属性值2
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
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 617);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	-- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	--skill.nCostManaBasePercent = 393;	-- 技能消耗的内力
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
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 40;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64*0.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4)*0.2
	else
		skill.nChannelInterval = 143*0.2;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 143; 				-- 通道技间隔时间
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
function Apply(dwCharacterID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com