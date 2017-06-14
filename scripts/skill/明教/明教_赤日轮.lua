---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_赤日轮.lua
-- 更新时间:	2015/2/4 14:32:39
-- 更新用户:	mengxiangfei11
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
	{nLunarDamage = 42 * 2 * 0.98, nLunarDamageRand = 42 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 77 * 2 * 0.98, nLunarDamageRand = 77 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 100 * 2 * 0.98, nLunarDamageRand = 100 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 123 * 2 * 0.98, nLunarDamageRand = 123 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 146 * 2 * 0.98, nLunarDamageRand = 146 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 169 * 2 * 0.98, nLunarDamageRand = 169 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 192 * 2 * 0.98, nLunarDamageRand = 192 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 215 * 2 * 0.98, nLunarDamageRand = 215 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 238 * 2 * 0.98, nLunarDamageRand = 238 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 262 * 2 * 0.98, nLunarDamageRand = 262 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 303 * 2 * 0.98, nLunarDamageRand = 303 * 2 * 0.04, nCostMana = 186},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --第3下
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_赤日轮.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--第1下
		ATTRIBUTE_TYPE.CAST_SKILL,
		4028,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--第2下
		ATTRIBUTE_TYPE.CAST_SKILL,
		4029,
		dwSkillLevel
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--第3下
		ATTRIBUTE_TYPE.CAST_SKILL,
		4030,
		dwSkillLevel
		);
	--]]
	----------------- 设置CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(503);		-- 明教公共CD 1秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 505);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--后跳公共CD
	--skill.nDamageToManaForParty = 51;	-- 伤害的5%转为自身回内

	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*195;	-- 技能消耗的内力
	--------------- 设置杂项参数 ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0		 									--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度

	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	skill.nChannelInterval = 80;

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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3286)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(3962)
	if nlev == 0 then
		return
	end
	
	if player.GetSkillLevel(5988) == 1 then
		--有奇穴\释放眩晕目标三段攻击
		player.CastSkill(13669, nlev, player.GetSkillTarget())
		player.CastSkill(13670, nlev, player.GetSkillTarget())
		player.CastSkill(13671, nlev, player.GetSkillTarget())
		--有奇穴打非眩晕目标
		player.CastSkill(13672, nlev, player.GetSkillTarget())
		player.CastSkill(13673, nlev, player.GetSkillTarget())
		player.CastSkill(13674, nlev, player.GetSkillTarget())
	else
		--释放无奇穴的普通目标三段攻击
		player.CastSkill(4028, nlev, player.GetSkillTarget())
		player.CastSkill(4029, nlev, player.GetSkillTarget())
		player.CastSkill(4030, nlev, player.GetSkillTarget())
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com