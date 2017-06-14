---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_内功_云裳心经.lua
-- 更新时间:	2013/9/6 9:53:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  陈翰林	
-- 创建时间  :  2007-8-28
-- 技能效果  :  七秀内功
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{DecriticalDamagePowerBase = 13, nDodge = 2, nManaAdd = 348, nTherapy = 100, nManaReplenish = 1, nMagicDefence = 1},
	{DecriticalDamagePowerBase = 22, nDodge = 3, nManaAdd = 2121, nTherapy = 200, nManaReplenish = 2, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nDodge = 5, nManaAdd = 3164, nTherapy = 300, nManaReplenish = 2, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 47, nDodge = 7, nManaAdd = 4208, nTherapy = 400, nManaReplenish = 3, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 60, nDodge = 9, nManaAdd = 5251, nTherapy = 500, nManaReplenish = 4, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 72, nDodge = 11, nManaAdd = 6294, nTherapy = 600, nManaReplenish = 5, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 85, nDodge = 13, nManaAdd = 7337, nTherapy = 700, nManaReplenish = 5, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 98, nDodge = 15, nManaAdd = 14350, nTherapy = 800, nManaReplenish = 6, nMagicDefence = 14},
	{DecriticalDamagePowerBase = 110, nDodge = 17, nManaAdd = 24500, nTherapy = 900, nManaReplenish = 7, nMagicDefence = 15},
	{DecriticalDamagePowerBase = 244, nDodge = 38, nManaAdd = 33251, nTherapy = 1400, nManaReplenish = 7, nMagicDefence = 35},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--增加 根骨-治疗AP 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0       
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
		"skill/七秀/七秀_内功_云裳心经.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		680,
		2
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		681,
		2
	);	
	--化劲
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nManaAdd / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nManaAdd / 1200,
		0
		);
	--根骨提高治疗
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1741,
		0
		);
	--根骨额外提高会心
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		62,
		0
		);
	--根骨额外提高会笑
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		21,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nManaAdd,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DODGE,
		tSkillData[dwSkillLevel].nDodge,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);  
 
	--添加探梅、蛊惑众生技能事件  2011-12-8
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		639,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		640,
		0
	);
 
	--[[ skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,          --默认属性：被外功伤害10%定身509-397BUFF冰环
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		103,
		0
	);--]]
	--[[ if dwSkillLevel >= 3 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,          --30级属性 躲闪回血
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			259,
			0
		);
	end--]]
	-- 40级属性做在剑舞buff上

	-- 50级属性做在天地低昂技能上
	
	-- 60级属性做在心鼓弦技能上

	-- 70级技能做在风袖低昂上
    	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 157);
	--skill.SetNormalCoolDown(2, 152);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--技能施放最小半径
	--skill.nMaxRadius        = 2 * LENGTH_BASE;							--技能施放最大半径
	--skill.nAngleRange       = 128; 										--施放角度
    
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	
	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 5 and player.GetSkillLevel(10200) < 1 then		--学习镇派套路
		player.LearnSkill(10200)
	end
	--player.LearnSkill(536);
	player.LearnSkillLevel(536, dwSkillLevel, player.dwID)
	player.LearnSkill(538);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)	
	if player then
		player.AddBuff(player.dwID, player.nLevel, 6176, 2)
		player.SetTimer(16,"scripts/skill/七秀/七秀_内功_云裳心经.lua",0,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DelBuff(6176, 2)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(526,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com