---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_风来吴山.lua
-- 更新时间:	2014/7/9 20:20:01
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_风来吴山.lua
-- 创建人    :  zhangqi
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  风来吴山
-- 技能效果  :  风来吴山，吴山来风，草木皆伏
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

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

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--风来吴山伤害没奇穴
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1905,
		dwSkillLevel
		);
	--风来吴山有奇穴站立伤害1.3
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14618,
		dwSkillLevel
		);
	--风来吴山伤害有奇穴非站立状态正常
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14619,
		dwSkillLevel
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1801,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1908,
		1
	);  --2010.05.20添加打断技能动作用子技能

	skill.AddAttribute(														--70橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3084,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_灵峰剑式_风来吴山.lua",
		0
	);
	----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1, 1950, 1);		-- 设置1号位Buff 作用于自身的HOT
	--skill.BindBuff(2, 1856, 1);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff
	skill.AddSlowCheckSelfBuff(1694, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 343);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostRage = tSkillData[dwSkillLevel].nCostRage;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChannelInterval = 10; 				-- 通道技间隔时间
	--skill.nChannelInterval = 10; 				-- 通道技间隔时间
	skill.nChannelFrame = 84;	 			-- 通道技持续时间，单位帧数
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 6 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	--skill.nWeaponDamagePercent	= 2048;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	skill.nMinChannelInterval = 1;-- 通道技间隔时间
	skill.nMinChannelFrame = 1
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
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 1950, 1) --不能跳跃
		--local xiaori = player.GetBuff(1903,1)
		--local Level = player.GetSkillLevel(10145)
		--if xiaori == nil and Level >= 7 then
		player.AddBuff(0, 99, 1856, 1)	--免控
		--end
		for i = 1, 7 do
			if player.GetBuff(10103, 1) then
				player.DelGroupBuff(10103, 1)
			end

			if player.GetBuff(10104, 1) then
				player.DelGroupBuff(10104, 1)
			end
		end
		return nPreResult
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1362)
	end
end
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(9292)== 1 then 
		player.AddBuff(player.dwID,player.nLevel,7976,1)
	end
	--]]

	ModityCDToUI(player, 1645, 0, 0)
end




 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com