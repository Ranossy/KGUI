---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_苍雪刀_斩刀嘲讽目标.lua
-- 更新时间:	2014/10/21 20:34:15
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_定军.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-02-26 16:14
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  定军
-- 技能效果  :  使出枪之绝技，无数枪影笼罩对手，令其无法脱身只能应战，同时有一定伤害及仇恨。
--                   （傲血战意下目标无法移动，铁牢律下强制仇恨目标）
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = 1;
--08年9月3日 取消定军的 定身效果
	--施放子技能_定身
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		450,
--		dwSkillLevel
--	);
	--施放定军_子技能_嘲讽     ,不限制内功
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		449,
--		dwSkillLevel
--	);

	skill.BindBuff(1, 8419, 1); --仇恨BUFF

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);

	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 93);
	--skill.SetNormalCoolDown(2, 259);
	--skill.SetCheckCoolDown(1, 444)
	----------------- 技能仇恨 -------------------------------------------------
	skill.nBaseThreat = tSkillData[dwSkillLevel].nThreat;

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
--	skill.nCostManaBasePercent = 167;	-- 技能消耗的内力
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 15; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 0;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com