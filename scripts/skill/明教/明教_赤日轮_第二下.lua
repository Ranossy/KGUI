---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_赤日轮_第二下.lua
-- 更新时间:	2014/7/20 10:34:57
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
	{nDamageBase = 37, nDamageRand = 5, nCostMana = 0}, --level 1
	{nDamageBase = 40, nDamageRand = 5, nCostMana = 0}, --level 2
	{nDamageBase = 43, nDamageRand = 5, nCostMana = 0}, --level 3
	{nDamageBase = 46, nDamageRand = 5, nCostMana = 0}, --level 4
	{nDamageBase = 49, nDamageRand = 5, nCostMana = 0}, --level 5
	{nDamageBase = 52, nDamageRand = 5, nCostMana = 0}, --level 6
	{nDamageBase = 55, nDamageRand = 5, nCostMana = 0}, --level 7
	{nDamageBase = 58, nDamageRand = 5, nCostMana = 0}, --level 8
	{nDamageBase = 61, nDamageRand = 5, nCostMana = 0}, --level 9
	{nDamageBase = 64, nDamageRand = 5, nCostMana = 0}, --level 10
	{nDamageBase = 67, nDamageRand = 10, nCostMana = 0}, --level 11
	{nDamageBase = 70, nDamageRand = 10, nCostMana = 0}, --level 12
	{nDamageBase = 73, nDamageRand = 10, nCostMana = 0}, --level 13
	{nDamageBase = 76, nDamageRand = 10, nCostMana = 0}, --level 1
	{nDamageBase = 79, nDamageRand = 10, nCostMana = 0}, --level 2
	{nDamageBase = 82, nDamageRand = 10, nCostMana = 0}, --level 3
	{nDamageBase = 85, nDamageRand = 10, nCostMana = 0}, --level 4
	{nDamageBase = 88, nDamageRand = 10, nCostMana = 0}, --level 5
	{nDamageBase = 91, nDamageRand = 10, nCostMana = 0}, --level 6
	{nDamageBase = 94, nDamageRand = 10, nCostMana = 0}, --level 7
	{nDamageBase = 97, nDamageRand = 10, nCostMana = 0}, --level 8
	{nDamageBase = 100, nDamageRand = 10, nCostMana = 0}, --level 9
	{nDamageBase = 103, nDamageRand = 15, nCostMana = 0}, --level 10
	{nDamageBase = 106, nDamageRand = 15, nCostMana = 0}, --level 11
	{nDamageBase = 109, nDamageRand = 15, nCostMana = 0}, --level 12
	{nDamageBase = 112, nDamageRand = 15, nCostMana = 0}, --level 13
	{nDamageBase = 115, nDamageRand = 15, nCostMana = 0}, --level 1
	{nDamageBase = 118, nDamageRand = 15, nCostMana = 0}, --level 2
	{nDamageBase = 121, nDamageRand = 20, nCostMana = 0}, --level 3
	{nDamageBase = 124, nDamageRand = 20, nCostMana = 0}, --level 4
	{nDamageBase = 127, nDamageRand = 20, nCostMana = 0}, --level 5
	{nDamageBase = 130, nDamageRand = 20, nCostMana = 0}, --level 6
	{nDamageBase = 135, nDamageRand = 20, nCostMana = 0}, --level 7
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*1.1,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*1.1,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --加日能
		ATTRIBUTE_TYPE.CAST_SKILL,
		4031,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		4025,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --标记次数BUFF
		ATTRIBUTE_TYPE.CALL_BUFF,
		4025,
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
		"skill/明教/明教_赤日轮_第二下.lua",
		0
		);
	--加自动释放下一个技能的buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9486,
		2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(503);	--明教公共CD
	skill.SetNormalCoolDown(1, 507);	--三下之间CD
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内

	skill.AddSlowCheckSelfBuff(4025, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
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
		skill.nChannelInterval = 25*1.2;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (25 + (dwSkillLevel - 9) * 1.5)*1.2
	else
		skill.nChannelInterval = 77*1.2;     -- 通道技间隔时间
	end

	--skill.nChannelInterval	= 96;
	skill.nAreaRadius = 4 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 3;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)
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

	RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3962, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com