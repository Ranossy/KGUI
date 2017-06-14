------------------------------------------------
-- 文件名    :  天策_子技能_乱_高生命值.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-08-21
-- 修改时间  ： 2008-08-21
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  乱_高生命值
-- 技能效果  :  自身血量大于等于50%之后,造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 81 , nDamage = 78 *0.95, nDamageRand = 78 *0.1, nDebuffLevel = 1},		-- Level 1
	{nCostMana = 103, nDamage = 99 *0.95, nDamageRand = 99 *0.1, nDebuffLevel = 1},		-- Level 2
	{nCostMana = 125, nDamage = 120*0.95, nDamageRand = 120*0.1, nDebuffLevel = 1},		-- Level 3
	{nCostMana = 147, nDamage = 141*0.95, nDamageRand = 141*0.1, nDebuffLevel = 1},		-- Level 4 
	{nCostMana = 169, nDamage = 162*0.95, nDamageRand = 162*0.1, nDebuffLevel = 1},		-- Level 5
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	----------------- 设置技能施放buff需求 ----------------------------------------------------------------------

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    ----------------- 自身血量需求 ---------------------------------------------
	skill.nSelfLifePercentMin	= 51;			-- 血量最小值>=
	skill.nSelfLifePercentMax	= 100;			-- 血量最大值<=
	
	skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
     	skill.nChannelInterval	= 0; 									-- 通道技间隔时间    
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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