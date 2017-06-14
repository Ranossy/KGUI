---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_西子情_雪断桥.lua
-- 更新时间:	2013/5/29 20:42:52
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_西子情_雪断桥.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  西子情
-- 技能名称  :  雪断桥
-- 技能效果  :  悲，断桥残雪，一壶浊酒看断桥残雪。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 40, nCostRage = 0, nCostLife = 600, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1}, -- Level 1 
	{nAddRage = 42, nCostRage = 0, nCostLife = 600, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1}, -- Level 2 
	{nAddRage = 44, nCostRage = 0, nCostLife = 600, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1}, -- Level 3 
	{nAddRage = 46, nCostRage = 0, nCostLife = 600, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1}, -- Level 4 
	{nAddRage = 48, nCostRage = 0, nCostLife = 600, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1}, -- Level 5 
	{nAddRage = 50, nCostRage = 0, nCostLife = 600, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1}, -- Level 6 
	{nAddRage = 52, nCostRage = 0, nCostLife = 600, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1}, -- Level 7 
	{nAddRage = 54, nCostRage = 0, nCostLife = 600, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1}, -- Level 8 
	{nAddRage = 56, nCostRage = 0, nCostLife = 600, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1}, -- Level 9 
	{nAddRage = 58, nCostRage = 0, nCostLife = 600, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1}   	-- Level 10
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		20,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_西子情_雪断桥.lua",
		0
	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1781,
--		1
--	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 349);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostLife	= tSkillData[dwSkillLevel].nCostLife;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6549) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 2683, 2, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com