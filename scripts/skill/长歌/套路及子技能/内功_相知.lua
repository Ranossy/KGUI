---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/内功_相知.lua
-- 更新时间:	2015/10/13 15:19:06
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/内功_相知.lua
-- 更新时间:	2015/8/14 17:03:28
-- 更新用户:	mengxiangfei11
-- 脚本说明:
--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nMaxMana = 347, nTherapy = 100, nLifeReplenish = 2, nMagicDefence = 1, DecriticalDamagePowerBase = 13}, --15级
	{nMaxMana = 2110, nTherapy = 200, nLifeReplenish = 3, nMagicDefence = 3, DecriticalDamagePowerBase = 22}, --20级
	{nMaxMana = 3148, nTherapy = 300, nLifeReplenish = 5, nMagicDefence = 5, DecriticalDamagePowerBase = 35}, --30级
	{nMaxMana = 4187, nTherapy = 400, nLifeReplenish = 8, nMagicDefence = 6, DecriticalDamagePowerBase = 47}, --40级
	{nMaxMana = 5224, nTherapy = 500, nLifeReplenish = 10, nMagicDefence = 8, DecriticalDamagePowerBase = 60}, --50级
	{nMaxMana = 6262, nTherapy = 600, nLifeReplenish = 12, nMagicDefence = 10, DecriticalDamagePowerBase = 72}, --60级
	{nMaxMana = 7300, nTherapy = 700, nLifeReplenish = 14, nMagicDefence = 12, DecriticalDamagePowerBase = 85}, --70级
	{nMaxMana = 14278, nTherapy = 800, nLifeReplenish = 16, nMagicDefence = 14, DecriticalDamagePowerBase = 98}, --80级
	{nMaxMana = 24378, nTherapy = 900, nLifeReplenish = 18, nMagicDefence = 15, DecriticalDamagePowerBase = 110}, --90级
	{nMaxMana = 33084, nTherapy = 1464, nLifeReplenish = 41, nMagicDefence = 35, DecriticalDamagePowerBase = 244}, --95级
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
		tSkillData[dwSkillLevel].nMaxMana,
		0
	);
	--正常每秒回复内力值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMaxMana / 240,
		0
	);
	--每秒额外回复内力值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMaxMana / 1200,
		0
	);
	--额外生命上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
		0
	);
	--治疗AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);

	--内功防御值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD,
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	--气血每秒回复
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nLifeReplenish,
		0
	);
	--根骨额外提高治疗1.65
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1690,
		0
	);
	--根骨额外提高0.1会心等级
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		102,
		0
	);
	--根骨额外提高0.04会心效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		41,
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

	--切换心法执行脚本处理相关buff和图标
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/长歌/套路及子技能/内功_相知.lua",
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
	player.LearnSkillLevel(14088, skill.dwLevel, player.dwID)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(4, "scripts/skill/长歌/套路及子技能/内功_相知.lua", 0, 0)
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10448)

	--print(222222)
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
	local shang_lev = player.GetSkillLevel(14138)
	if shang_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14065, 14138, shang_lev)	--切换商技能
	end
	--切换角技能
	local jue_lev = player.GetSkillLevel(14139)
	if jue_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14066, 14139, jue_lev)	--切换角技能
	end
	--切换徵技能
	local zhi_lev = player.GetSkillLevel(14140)
	if zhi_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14067, 14140, zhi_lev)	--切换徵技能
	end
	--切换羽技能
	local yu_lev = player.GetSkillLevel(14141)
	if yu_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14068, 14141, yu_lev)	--切换羽技能
	end
	--切换到宫吟唱治疗
	local gong_lev = player.GetSkillLevel(14137)
	if gong_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14064, 14137, gong_lev)	--切换宫吟唱治疗
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14302, 14137, gong_lev)	--切换宫吟唱治疗
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14298, 14137, gong_lev)	--切换宫吟唱治疗
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

	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10448)
	if player.IsFormationLeader() then
		player.CastSkill(14172,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com