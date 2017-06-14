---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_君子风_听雷_问水诀.lua
-- 更新时间:	2013/7/24 14:16:11
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_君子风_听雷_问水诀.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  君子风
-- 技能名称  :  听雷
-- 技能效果  :  雷鸣不惊，沉稳大气。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 94, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 96, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 104, nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 116, nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 124, nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 132, nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 134, nDamageRand = 7}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 136, nDamageRand = 8}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 138, nDamageRand = 8}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 9}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 144, nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 150, nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, nDamageRand = 11}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 162, nDamageRand = 11}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 12}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 178, nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 188, nDamageRand = 13}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 198, nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 200, nDamageRand = 14}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 205, nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 210, nDamageRand = 16}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 215, nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 220, nDamageRand = 17}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 225, nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 230, nDamageRand = 18}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 235, nDamageRand = 19}, -- Level 27 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 240, nDamageRand = 19}, -- Level 28 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 245, nDamageRand = 20}, -- Level 29 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 250, nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 255, nDamageRand = 21}, -- Level 31 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 260, nDamageRand = 22}, -- Level 32 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 265, nDamageRand = 22}, -- Level 33 
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1894,
--		1
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	--6260这个技能没有实装了，暂时没用。
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6260,
		dwSkillLevel
	);--奇穴额外伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6954,
		dwSkillLevel
	);--90橙武额外伤害
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 344);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 16 * 1.1;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 8) * 5) *1.1
	else
		skill.nChannelInterval = 144 * 1.1;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 144;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
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


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com