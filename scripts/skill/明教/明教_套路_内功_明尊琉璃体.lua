---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_套路_内功_明尊琉璃体.lua
-- 更新时间:	2015/8/17 8:44:05
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nHP = 275, nMP = 114, nPhysicsDefence = 3, nMagicDefence = 3, nDodge = 7, nPhysicsCri = 5, nPhysicsHit = 4  }, --level 1	--15
	{ nHP = 470, nMP = 200, nPhysicsDefence = 6, nMagicDefence = 6, nDodge = 12, nPhysicsCri = 6, nPhysicsHit = 5  }, --level 2	--20
	{ nHP = 1004, nMP = 457, nPhysicsDefence = 9, nMagicDefence = 9, nDodge = 19, nPhysicsCri = 9, nPhysicsHit = 7  }, --level 3	--30
	{ nHP = 1450, nMP = 661, nPhysicsDefence = 13, nMagicDefence = 13, nDodge = 26, nPhysicsCri = 11, nPhysicsHit = 9  }, --level 4	--40
	{ nHP = 1895, nMP = 865, nPhysicsDefence = 16, nMagicDefence = 16, nDodge = 33, nPhysicsCri = 13, nPhysicsHit = 11 }, --level 5	--50
	{ nHP = 2340, nMP = 1069, nPhysicsDefence = 20, nMagicDefence = 20, nDodge = 39, nPhysicsCri = 16, nPhysicsHit = 13 }, --level 6	--60
	{ nHP = 3180, nMP = 1274, nPhysicsDefence = 23, nMagicDefence = 23, nDodge = 46, nPhysicsCri = 18, nPhysicsHit = 15 }, --level 7	--70
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 27, nMagicDefence = 27, nDodge = 53, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 8	--80
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 30, nMagicDefence = 30, nDodge = 60, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 9	--90
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 66, nMagicDefence = 66, nDodge = 133, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 10	--95
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_套路_内功_明尊琉璃体.lua",
		0
	);
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
	--增加 体质-1.25气血上限 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_LIFE_COF,
		1280,
		0
	);

	--增加 体质-0.225闪避等级 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_DODGE_COF,
		230,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);
	--日能最大值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_SUN_ENERGY,
		10000,
		0
	);

	--月能最大值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MOON_ENERGY,
		10000,
		0
	);

	--非战斗下日能每秒衰减值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SUN_ENERGY_FALL_OFF,
		100,
		0
	);

	--非战斗下月能每秒衰减值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MOON_ENERGY_FALL_OFF,
		100,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(25 + 2 * dwSkillLevel) / 100 * 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --闪避
		ATTRIBUTE_TYPE.DODGE,
		tSkillData[dwSkillLevel].nDodge,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE,
		tSkillData[dwSkillLevel].nPhysicsDefence,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_PERCENT, -- 内力每秒回复
		1024,
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

	--日月套路为带仇恨的秘籍
	for i = 1154, 1163 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
			i,
			1
		);
	end
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		512
	);
	--极乐引全团无威胁气劲并嘲讽目标
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		838,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		892,
		1
		);
	--寒月耀打断事件
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1296,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --净世破魔击日判个数
	--ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
	--893,
	--0
	--);
	--12层大奇穴效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1335,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1336,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1337,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1338,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1339,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1340,
		1
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 565);
--	skill.SetNormalCoolDown(2, 152);

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

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end

	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 10  and player.GetSkillLevel(10240) < 1 then		--学习镇派套路
		player.LearnSkill(10240)
	end
	--player.LearnSkill(4260);
	player.LearnSkillLevel(4260, dwSkillLevel, player.dwID)
	player.LearnSkill(4261);
	player.LearnSkill(4432);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/明教/明教_套路_内功_明尊琉璃体.lua",0,0)
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
		player.CastSkill(4687,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com