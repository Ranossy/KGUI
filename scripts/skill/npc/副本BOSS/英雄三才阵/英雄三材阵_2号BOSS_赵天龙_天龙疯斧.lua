------------------------------------------------
-- 文件名    :  英雄三材阵_2号BOSS_赵天龙_天龙疯斧.lua
-- 创建人    :  CBG
-- 创建时间  :  2009-5-13
-- 用途(模块):  副本
-- 武功门派  :  英雄三材阵_2号BOSS_赵天龙技能
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  造成50%防天策HP伤害
----------------------低调的分割线--------------------------

--------------脚本文件开始------------------------------------------------ 

Include("scripts/Include/Skill.lh")                   
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 420 *0.8, nDamageRand = 420 *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 711 *0.8, nDamageRand = 711 *0.4, nCostMana = 0},		--level 2		 
	{nDamageBase = 1020 *0.8, nDamageRand = 1020 *0.4, nCostMana = 0},		--level 3		
	{nDamageBase = 1484*0.8, nDamageRand = 1484 *0.4, nCostMana = 0},		--level 4		
	{nDamageBase = 1948*0.8, nDamageRand = 1948*0.4, nCostMana = 0},		--level 5		
	{nDamageBase = 2680*0.8, nDamageRand = 2680*0.4, nCostMana = 0},		--level 6		
	{nDamageBase = 3195*0.8, nDamageRand = 3195*0.4, nCostMana = 0},		--level 7		
	{nDamageBase = 3711*0.8, nDamageRand = 3711*0.4, nCostMana = 0},		--level 8		
	{nDamageBase = 4226*0.8, nDamageRand = 4226*0.4, nCostMana = 0},		--level 9		
	{nDamageBase = 4742*0.8, nDamageRand = 4742*0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 5257*0.8, nDamageRand = 5257*0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 5773*0.8, nDamageRand = 5773*0.4, nCostMana = 0},		--level 12			                                           
	{nDamageBase = 6288*0.8, nDamageRand = 6288*0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 6804*0.8, nDamageRand = 6804*0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 7319*0.8, nDamageRand = 7319*0.4, nCostMana = 0},		--level 15	
	{nDamageBase = 7835*0.8, nDamageRand = 7835*0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 8350*0.8, nDamageRand = 8305*0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 8866*0.8, nDamageRand = 8866*0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 9381*0.8, nDamageRand = 9381*0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 9897*0.8, nDamageRand = 9897*0.4, nCostMana = 0},		--level 20		
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,				
        tSkillData[dwSkillLevel].nDamageBase * 0.14 * 0.7, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14 * 0.7, 
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
    --skill.SetPublicCoolDown(16);	--公共CD
	--skill.SetNormalCoolDown(1, 151);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;		-- 技能施放的最大距离
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius       = 10 * LENGTH_BASE;
    skill.nTargetCountLimit	= 10;

   -- skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    --skill.nWeaponDamagePercent		= 0;
    --skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	--skill.nTargetCountLimit	= 5;
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