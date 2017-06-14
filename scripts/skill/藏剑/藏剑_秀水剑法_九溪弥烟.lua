------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_九溪弥烟.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  秀水剑法
-- 技能名称  :  九溪弥烟
-- 技能效果  :  溪水迷离如烟，弥漫于九溪十八涧
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, 	nDamageRand = 6}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 23, 	nDamageRand = 6}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 26, 	nDamageRand = 6}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, 	nDamageRand = 6}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29, 	nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 33, 	nDamageRand = 6}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35, 	nDamageRand = 6}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 37, 	nDamageRand = 6}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 39, 	nDamageRand = 6}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 6},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 41, 	nDamageRand = 6}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, 	nDamageRand = 6}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 6}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, 	nDamageRand = 6}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 45, 	nDamageRand = 6}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 6}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, 	nDamageRand = 6}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, 	nDamageRand = 6}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 6}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 6}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 8}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 8}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 53, 	nDamageRand = 8}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 8}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, 	nDamageRand = 8}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, 	nDamageRand = 10}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 57, 	nDamageRand = 10}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 10}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, 	nDamageRand = 10}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, 	nDamageRand = 10}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 10}, -- Level 32 
	
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 333);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	-----------------技能施放技能需求-------------------------------------------
	skill.AddCheckSelfLearntSkill(14603, 0, SKILL_COMPARE_FLAG.EQUAL);    --检查比较Caster自己已学习的技能ID和等级
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 16*1.1;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 4) * 1)*1.1
	else
		skill.nChannelInterval = 48*1.1;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval	= 48;
	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 256; 										--施放角度,全角256
	skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	skill.nTargetCountLimit	= 10;
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

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com