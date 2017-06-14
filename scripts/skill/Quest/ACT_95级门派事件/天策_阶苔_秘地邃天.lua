---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_95级门派事件/天策_阶苔_秘地邃天.lua
-- 更新时间:	2015/12/18 18:00:26
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 50, nDamageBase = 108, nDamageRand = 3}, -- Level 1
	{nAddRage = 0, nCostRage = 50, nDamageBase = 124, nDamageRand = 4}, -- Level 2
	{nAddRage = 0, nCostRage = 50, nDamageBase = 140, nDamageRand = 5}, -- Level 3
	{nAddRage = 0, nCostRage = 50, nDamageBase = 156, nDamageRand = 5}, -- Level 4
	{nAddRage = 0, nCostRage = 50, nDamageBase = 172, nDamageRand = 6}, -- Level 5
	{nAddRage = 0, nCostRage = 50, nDamageBase = 188, nDamageRand = 7}, -- Level 6
	{nAddRage = 0, nCostRage = 50, nDamageBase = 204, nDamageRand = 8}, -- Level 7
	{nAddRage = 0, nCostRage = 50, nDamageBase = 220, nDamageRand = 9}, -- Level 8
	{nAddRage = 0, nCostRage = 50, nDamageBase = 236, nDamageRand = 9}, -- Level 9
	{nAddRage = 0, nCostRage = 50, nDamageBase = 252, nDamageRand = 10}, -- Level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	--伤害技能
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		0,
		1
	);

	----------------- BUFF相关 -------------------------------------------------

	----------------- 设置杂项参数 ----------------------------------------------------------------------
	skill.nPrepareFrames  	= 80;				-- 吟唱帧数
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval = 10; 				-- 通道技间隔时间
	--skill.nChannelInterval = 10; 				-- 通道技间隔时间
	--skill.nChannelFrame = 80;	 			-- 通道技持续时间，单位帧数
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 12 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	--skill.nWeaponDamagePercent	= 2048;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	skill.nMinChannelInterval = 2;-- 通道技间隔时间
	skill.nMinChannelFrame = 2
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
end



 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com