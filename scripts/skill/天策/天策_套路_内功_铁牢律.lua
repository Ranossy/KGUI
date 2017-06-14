---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_套路_内功_铁牢律.lua
-- 更新时间:	2013/9/5 17:16:36
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_套路_内功系.lua
-- 创建人    :  张奇		
-- 创建时间  :  2008-03-24
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  内功
-- 武功套路  :  是
-- 技能名称  :  内功系
-- 技能效果  :  武功套路，装备后根据增加防御值,增加躲闪值
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nHP = 263, nMP = 269, nPhysicsShield = 7, nParry = 4, nParryValue = 19, nThreatCof = 204}, --level 1	--15
	{ nHP = 453, nMP = 1642, nPhysicsShield = 12, nParry = 7, nParryValue = 33, nThreatCof = 204}, --level 2	--20
	{ nHP = 973, nMP = 2449, nPhysicsShield = 19, nParry = 11, nParryValue = 51, nThreatCof = 204}, --level 3	--30
	{ nHP = 1406, nMP = 3256, nPhysicsShield = 26, nParry = 15, nParryValue = 70, nThreatCof = 204}, --level 4	--40
	{ nHP = 1839, nMP = 4064, nPhysicsShield = 33, nParry = 20, nParryValue = 89, nThreatCof = 204}, --level 5	--50
	{ nHP = 2272, nMP = 4871, nPhysicsShield = 39, nParry = 24, nParryValue = 107, nThreatCof = 204}, --level 6	--60
	{ nHP = 2706, nMP = 5678, nPhysicsShield = 46, nParry = 28, nParryValue = 126, nThreatCof = 204}, --level 7	--70
	{ nHP = 6639, nMP = 11107, nPhysicsShield = 53, nParry = 32, nParryValue = 144, nThreatCof = 204}, --level 8	--80
	{ nHP = 6639, nMP = 18964, nPhysicsShield = 60, nParry = 36, nParryValue = 163, nThreatCof = 204}, --level 9	--90
	{ nHP = 6639, nMP = 25737, nPhysicsShield = 133, nParry = 80, nParryValue = 361, nThreatCof = 204}, --level 10	--95
};
--这里的表是天策_崩_打断成功效果之后的伤害技能事件ID,通过内功不同等级来区别,以此逐级增加伤害.
tSkillEventData = 
{
	{nLevel = 1, nEventID = 118 };
	{nLevel = 2, nEventID = 118 };
	{nLevel = 3, nEventID = 118 };	--崩第一次出现在32级
	{nLevel = 4, nEventID = 145 };	--40
	{nLevel = 5, nEventID = 146 };	--50
	{nLevel = 6, nEventID = 147 };	--60
	{nLevel = 7, nEventID = 148 }	--最后升到70级
	
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
		"skill/天策/天策_套路_内功_铁牢律.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0       
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);

	--体质转招架
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_PARRY_COF,
		102,
		0
	);	
	--体质转外防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_PHYSICS_SHIELD_COF,
		102,
		0
		);
	--体质转气血
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_LIFE_COF,
		1536,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		768,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(25 + 2 * dwSkillLevel) / 100 * 1024,
		0
	);	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nMP,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE,
		tSkillData[dwSkillLevel].nPhysicsShield,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PARRY_BASE,
		tSkillData[dwSkillLevel].nParry,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PARRYVALUE_BASE,
		tSkillData[dwSkillLevel].nParryValue,
		0
	);
--添加 铁牢心法的仇恨效果提升50%   2011/6/27	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		512
	);
		
--添加 铁牢律被击触发坚韧效果.被所有伤害技能攻击：25%几率触发414-202BUFF-外功防御提高5%，叠5层，持续30秒
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		68,
		0
	);--]]

----这里添加 龙吟的技能事件
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
--		88,
--		0
--	);
--这里添加 破坚阵打断施法的技能事件：破坚阵命中正在运功的目标100%触发478：击倒
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		114,
		0
	);	
--这里添加 崩打断施法的技能事件,分成5级,以实现伤害不同的效果.
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		148,
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1110,
		2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1240,
		1
		);
	--心法增加破风基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		4039,
		3
		);
	--心法增加穿云基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1771,
		1
		);
	--心法增加龙吟基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1772,
		1
		);
	--心法增加灭基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1773,
		1
		);
	--心法增加龙牙基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1774,
		1
		);
	--心法增加龙牙基础威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1775,
		1
		);
	--疾默认晕人
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	--普通攻击放大器
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 153);
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
	if player.dwForceID == 3 and player.GetSkillLevel(10197) < 1 then		--学习镇派套路
		player.LearnSkill(10197)
	end
	--player.LearnSkill(531);
	player.LearnSkillLevel(531, dwSkillLevel, player.dwID)
	player.LearnSkill(532)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/天策/天策_套路_内功_铁牢律.lua",0,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
	if player.IsFormationLeader() then
		player.CastSkill(662,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com