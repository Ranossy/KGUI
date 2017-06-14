---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/内功_莫问.lua
-- 更新时间:	2015/10/13 15:17:42
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/内功_莫问.lua
-- 更新时间:	2015/8/14 17:33:12
-- 更新用户:	mengxiangfei11
-- 脚本说明:
--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nMP = 315, nSpunkAttackPower = 11, nNeHit = 2, nMagicDefence = 1, nLunarCritical = 2, DecriticalDamagePowerBase = 13}, --15级
	{nMP = 1917, nSpunkAttackPower = 18, nNeHit = 5, nMagicDefence = 2, nLunarCritical = 3, DecriticalDamagePowerBase = 22}, --20级
	{nMP = 2860, nSpunkAttackPower = 29, nNeHit = 8, nMagicDefence = 4, nLunarCritical = 6, DecriticalDamagePowerBase = 35}, --30级
	{nMP = 3803, nSpunkAttackPower = 42, nNeHit = 10, nMagicDefence = 5, nLunarCritical = 8, DecriticalDamagePowerBase = 47}, --40级
	{nMP = 4746, nSpunkAttackPower = 55, nNeHit = 13, nMagicDefence = 6, nLunarCritical = 10, DecriticalDamagePowerBase = 60}, --50级
	{nMP = 5688, nSpunkAttackPower = 66, nNeHit = 16, nMagicDefence = 8, nLunarCritical = 12, DecriticalDamagePowerBase = 72}, --60级
	{nMP = 6631, nSpunkAttackPower = 78, nNeHit = 19, nMagicDefence = 9, nLunarCritical = 14, DecriticalDamagePowerBase = 85}, --70级
	{nMP = 12971, nSpunkAttackPower = 92, nNeHit = 22, nMagicDefence = 11, nLunarCritical = 16, DecriticalDamagePowerBase = 98}, --80级
	{nMP = 22145, nSpunkAttackPower = 102, nNeHit = 25, nMagicDefence = 12, nLunarCritical = 19, DecriticalDamagePowerBase = 110}, --90级
	{nMP = 30055, nSpunkAttackPower = 320, nNeHit = 56, nMagicDefence = 28, nLunarCritical = 42, DecriticalDamagePowerBase = 244}, --95级
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	--抗摔
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0
	);
	--化劲
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
	);
	--降低吟唱被打退的几率
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
		0
	);
	--总威胁值降低
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	--心法额外提高的内力
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE, -- 内力最大值
		tSkillData[dwSkillLevel].nMP,
		0
	);
	--正常每秒回复内力值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	--每秒额外回复内力值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);
	--额外生命上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
	);

	--内功AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_BASE, -- 内功AP
		tSkillData[dwSkillLevel].nSpunkAttackPower,
		0
	);
	--阴性内功命中
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_HIT_VALUE, -- 阴性内功命中
		tSkillData[dwSkillLevel].nNeHit,
		0
	);
	--阴性内功会心值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE, -- 阴性内功会心值
		tSkillData[dwSkillLevel].nLunarCritical,
		0
	);
	--内功防御值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	--根骨加层阴性内功AP(1024基数)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_ATTACK_POWER_COF,
		1895,
		0
	);
	--增加 根骨-阴性内功会心值 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		154,
		0
	);
	--增加 根骨-阴性内功会心值 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		51,
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
	--切换心法时删除各种buff和切换技能图标
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/长歌/套路及子技能/内功_莫问.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 339);
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

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	player.LearnSkillLevel(14087, skill.dwLevel, player.dwID)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(4, "scripts/skill/长歌/套路及子技能/内功_莫问.lua", 0, 0)
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10447)

	--删除曲带来的主动效果
	--高山流水
	if player.GetBuff(9377, 1) then
		player.DelBuff(9377, 1)
	end

	--添加持续判定buff
	player.AddBuff(player.dwID, player.nLevel, 9641, 1)
	
	--删除曲的被动效果
	for i = 1, 4 do
		if player.GetBuff(9318 + i, 1) then
			player.DelBuff(9318 + i, 1)
		end
	end

	--删除清绝影歌影子状态标记buff
	if player.GetBuff(9506, 1) then
		player.DelBuff(9506, 1)
	end

	--切换心法自动切换技能栏上对应的双心法图标
	--切换商技能
	local shang_lev = player.GetSkillLevel(14065)
	if shang_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14138, 14065, shang_lev)	--切换商技能
	end
	--切换角技能
	local jue_lev = player.GetSkillLevel(14066)
	if jue_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14139, 14066, jue_lev)	--切换角技能
	end
	--切换徵技能
	local zhi_lev = player.GetSkillLevel(14067)
	if zhi_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14140, 14067, zhi_lev)	--切换徵技能
	end
	--切换羽技能
	local yu_lev = player.GetSkillLevel(14068)
	if yu_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14141, 14068, yu_lev)	--切换羽技能
	end
	--切换宫技能（要判定当前奇穴）
	local gong_lev = player.GetSkillLevel(14064)
	if gong_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14137, 14064, gong_lev)	--切换宫吟唱
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14303, 14064, gong_lev)	--切换宫吟唱
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14300, 14064, gong_lev)	--切换宫吟唱
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetBuff(9641, 1) then
		player.DelBuff(9641, 1)
	end

	for i = 1, 4 do
		if player.GetBuff(9318 + i, 1) then
			player.DelBuff(9318 + i, 1)
		end
	end
end


function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10447)
	if player.IsFormationLeader() then
		player.CastSkill(14181,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com