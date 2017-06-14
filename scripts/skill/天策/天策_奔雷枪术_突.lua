---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_奔雷枪术_突.lua
-- 更新时间:	2013/4/17 16:47:26
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_奔雷枪术_突.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-04 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  突
-- 技能效果  :  从空中冲下,造成单体伤害,能在跳跃中使用
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 34, nCostMana = 63, nDashSpeed = 120}, -- Level 1 Dash速度单位 点/帧
	{nDamage = 44, nCostMana = 83, nDashSpeed = 120}, -- Level 2
	{nDamage = 54, nCostMana = 103, nDashSpeed = 120}, -- Level 3
	{nDamage = 65, nCostMana = 122, nDashSpeed = 120}, -- Level 4
	{nDamage = 75, nCostMana = 142, nDashSpeed = 120}, -- Level 5
	{nDamage = 86, nCostMana = 162, nDashSpeed = 120}, -- Level 6
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7, 
		10000
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		2, 
		10000
		);
	--]]
	--副本组的冲刺技能标记buff需求
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3004,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/突减伤.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 98);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 197;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 8 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
   
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(41)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	

	player.DelMultiGroupBuffByFunctionType(4);
	player.DelMultiGroupBuffByFunctionType(6);
	player.DelMultiGroupBuffByFunctionType(8);
	player.DelMultiGroupBuffByFunctionType(7);
	
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com