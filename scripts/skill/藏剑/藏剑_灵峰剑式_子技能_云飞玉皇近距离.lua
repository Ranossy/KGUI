---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_子技能_云飞玉皇近距离.lua
-- 更新时间:	2013/5/12 14:53:53
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_子技能_云飞玉皇近距离.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 400, 	nDamageRand = 12}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, 	nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 440, 	nDamageRand = 20}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 460, 	nDamageRand = 24}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 480, 	nDamageRand = 28}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 500, 	nDamageRand = 32}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 520, 	nDamageRand = 36}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 540, 	nDamageRand = 40}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 560, 	nDamageRand = 44}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 580, 	nDamageRand = 48}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 600, 	nDamageRand = 52},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 620, 	nDamageRand = 56}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 640, 	nDamageRand = 60}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 660, 	nDamageRand = 64}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 680, 	nDamageRand = 68}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 688, 	nDamageRand = 72}, -- Level 16
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;


	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*0.35,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*0.35,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	
	
	skill.AddSlowCheckSelfBuff(2682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
--   	skill.nChannelInterval	= 128;

	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	
	skill.nChannelInterval = 40*1.1;
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