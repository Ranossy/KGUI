---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_龙爪功_捣虚式100%.lua
-- 更新时间:	2016/9/22 15:58:06
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
	{nDamage = 52, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 62, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 72, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 82, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 92, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 102, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 112, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 122, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 132, nDamageRand = 5, nCostMana = 53 }, --level 1
	{nDamage = 142, nDamageRand = 5, nCostMana = 53 }, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/少林/少林_龙爪功_捣虚式100%.lua",
		0
		);

	
	skill.AddSlowCheckSelfBuff(3880, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2687, 1);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 421);
	--skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 67;	-- 技能消耗的内力
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 15; 				-- 通道技间隔时间
	if dwSkillLevel <= 9 then
		skill.nChannelInterval = (120 + (dwSkillLevel - 1) * 5) * 1.15;
	else
		skill.nChannelInterval = 160 * 1.2 * 1.15;	 			-- 通道技持续时间，单位帧数
	end
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	--skill.nWeaponDamagePercent		= 0;
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧

	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断

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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--其它段位也会调用到这里
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if player.GetSkillLevel(16886) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 576, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com