------------------------------------------------
-- 文件名    :  一刀流_同归于尽.lua
-- 创建人    :  陈步高	
-- 创建时间  :  2008-08-28
-- 用途(模块):  武功技能
-- 武功门派  :  一刀流
-- 武功类型  :  内功
-- 技能名称  :  同归于尽
-- 技能效果  :  范围技能,自爆身亡。施法时间为2秒。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{       { nCostMana = 0, nDamage = 40 , nDamageRand = 8},		-- Level 1
        { nCostMana = 0, nDamage = 58 , nDamageRand = 11},		-- Level 2
        { nCostMana = 0, nDamage = 80 , nDamageRand = 15},		-- Level 3
        { nCostMana = 0, nDamage = 108 , nDamageRand = 20},		-- Level 4
        { nCostMana = 0, nDamage = 142 , nDamageRand = 31},		-- Level 5
        { nCostMana = 0, nDamage = 203 , nDamageRand = 50},		-- Level 6
        { nCostMana = 0, nDamage = 286 , nDamageRand = 70},		-- Level 7
	      { nCostMana = 0, nDamage = 382 , nDamageRand = 108},		-- Level 8
	      { nCostMana = 0, nDamage = 499 , nDamageRand = 118},		-- Level 9
	      { nCostMana = 0, nDamage = 643 , nDamageRand = 150},		-- Level 10
	      { nCostMana = 0, nDamage = 782 , nDamageRand = 170},		-- Level 11
        { nCostMana = 0, nDamage = 957 , nDamageRand = 195},		-- Level 12
        { nCostMana = 0, nDamage = 1145 , nDamageRand = 210},		-- Level 13
        { nCostMana = 0, nDamage = 1408 , nDamageRand = 306},		-- Level 14
        { nCostMana = 0, nDamage = 1758 , nDamageRand = 400},		-- Level 15
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0, 
		0
	);
	          --自杀
skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		10000, 
		0
	); 


    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
	
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	--skill.nWeaponDamagePercent	= 1024;
	
    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 6 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度,全角256
    
    skill.nAreaRadius		= 6 * LENGTH_BASE;	
    
    skill.nPrepareFrames    = 32;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
   	skill.nTargetCountLimit	= 5;
   
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