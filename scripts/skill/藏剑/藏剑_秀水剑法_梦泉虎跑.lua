---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_梦泉虎跑.lua
-- 更新时间:	2013/8/21 14:31:31
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_梦泉虎跑.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  秀水剑法
-- 技能名称  :  梦泉虎跑
-- 技能效果  :  一个和尚做梦，梦见老虎奔跑，所到之处劲泉涌出，故名虎跑泉
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 8, nDamageRand = 1}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 9, nDamageRand = 1}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 10, nDamageRand = 1}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 11, nDamageRand = 1}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 12, nDamageRand = 1}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 13, nDamageRand = 1}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 14, nDamageRand = 2}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 15, nDamageRand = 2}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 16, nDamageRand = 2}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 17, nDamageRand = 2}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 18, nDamageRand = 2}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 19, nDamageRand = 2}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, nDamageRand = 2}, -- Level 13
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1802,
		1
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_秀水剑法_梦泉虎跑.lua",
		0
	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--		tSkillData[dwSkillLevel].nDamage, 
--		0
--	);
--
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--		tSkillData[dwSkillLevel].nDamageRand, 
--		0
--	);
    
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--		0, 
--		0
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1702,
		1
	);  --梦泉虎跑换动作隐藏Buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1591,   
		dwSkillLevel
	); --梦泉虎跑循环
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1686,
		1
	); --表现切换
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1783,
--		1
--	);
-- 	skill.BindBuff(1,1702,1) --换动作用的隐藏BUFF

	skill.AddAttribute(														--2010.05.09添加70橙武技能
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3085,
		1
	);	
	
	skill.AddAttribute(														--2010.07.12 70橙武
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1941,
		1
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 336);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 15 * LENGTH_BASE;							--技能施放最大半径
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
		player.AcquireAchievement(1360)
	end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(6544) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 1802, 2, 1)
	end
	--]]
	if player.IsSkillRecipeActive(1578, 1) then
		player.AddBuff(dwCharacterID, player.nLevel, 6547, 1, 1)
	end
	
	--怜光、云体奇穴减伤效果
	if player.GetSkillLevel(5957) == 1 then
		if player.GetSkillLevel(6544) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 1)
		end
	else
		if player.GetSkillLevel(6544) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 2)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 1802, 1)
		end
	end

	--虎跑免控
	player.AddBuff(dwCharacterID,player.nLevel,7699,1)
	--[[
	--怜光奇穴添加虎跑效果
	if player.GetSkillLevel(5957) ~= 1 then
		player.AddBuff(dwCharacterID,player.nLevel,7699,1)
	end
	--]]
	ModityCDToUI(player, 1589, 0, 0)
end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com