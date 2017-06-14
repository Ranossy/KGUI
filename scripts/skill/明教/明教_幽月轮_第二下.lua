---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_幽月轮_第二下.lua
-- 更新时间:	2014/7/20 11:01:17
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20120613
-- 技能效果  :  明教技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 100 * 0.95, nDamageRand = 25 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 110 * 0.95, nDamageRand = 40 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 120 * 0.95, nDamageRand = 56 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 130 * 0.95, nDamageRand = 71 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 140 * 0.95, nDamageRand = 87 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 150 * 0.95, nDamageRand = 102 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 160 * 0.95, nDamageRand = 118 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 170 * 0.95, nDamageRand = 133 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 180 * 0.95, nDamageRand = 149 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 190 * 0.95, nDamageRand = 164 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 200 * 0.95, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 210 * 0.95, nDamageRand = 195 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 220 * 0.95, nDamageRand = 211 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 230 * 0.95, nDamageRand = 226 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 257 * 0.95, nDamageRand = 257 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 273 * 0.95, nDamageRand = 273 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 288 * 0.95, nDamageRand = 288 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 304 * 0.95, nDamageRand = 304 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 319 * 0.95, nDamageRand = 319 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 335 * 0.95, nDamageRand = 335 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 350 * 0.95, nDamageRand = 350 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 366 * 0.95, nDamageRand = 366 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 381 * 0.95, nDamageRand = 381 * 0.1, nCostMana = 0}, --level 11
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --额外加10%会心
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		500,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MOON_ENERGY,
		2000,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		4019,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --标记次数BUFF
		ATTRIBUTE_TYPE.CALL_BUFF,
		4019,
		2
	);

--增加武器伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	--标记数字
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_幽月轮_第二下.lua",
		0
	);
	--加自动释放下一个技能的buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9486,
		4
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(503);	--明教公共CD
	skill.SetNormalCoolDown(1, 504);	--三下之间CD
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内

	skill.AddSlowCheckSelfBuff(4019, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*195;	-- 技能消耗的内力
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0		 									--技能施放最小半径
	skill.nMaxRadius = 6 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度
	skill.nWeaponDamagePercent = 1024;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 32*1.2;
	elseif dwSkillLevel < 24 then
		skill.nChannelInterval = (32 + (dwSkillLevel - 9) * 2)*1.2
	else
		skill.nChannelInterval = 70*1.2;     -- 通道技间隔时间
	end

	--skill.nChannelInterval	= 88;

	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧

	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能

end

function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3959, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com