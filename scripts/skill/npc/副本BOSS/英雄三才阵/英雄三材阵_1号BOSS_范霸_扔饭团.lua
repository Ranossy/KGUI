------------------------------------------------
-- 文件名    :  英雄三材阵_1号BOSS_范霸_扔饭团.lua
-- 创建人    :  韩正春
-- 创建时间  :  2009-5-13
-- 用途(模块):  副本
-- 武功门派  :  英雄三材阵_1号BOSS_范霸技能
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  物理范围伤害15%天策HP
----------------------低调的分割线--------------------------

--------------脚本文件开始------------------------------------------------ 

Include("scripts/Include/Skill.lh")                   
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 184  *0.8, nDamageRand = 184  *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 312  *0.8, nDamageRand = 312  *0.4, nCostMana = 0},		--level 2		 
	{nDamageBase = 448  *0.8, nDamageRand = 448  *0.4, nCostMana = 0},		--level 3		
	{nDamageBase = 652  *0.8, nDamageRand = 652  *0.4, nCostMana = 0},		--level 4		
	{nDamageBase = 856  *0.8, nDamageRand = 856  *0.4, nCostMana = 0},		--level 5		
	{nDamageBase = 1178 *0.8, nDamageRand = 1178 *0.4, nCostMana = 0},		--level 6		
	{nDamageBase = 1404 *0.8, nDamageRand = 1404 *0.4, nCostMana = 0},		--level 7		
	{nDamageBase = 1631 *0.8, nDamageRand = 1631 *0.4, nCostMana = 0},		--level 8		
	{nDamageBase = 1857 *0.8, nDamageRand = 1857 *0.4, nCostMana = 0},		--level 9		
	{nDamageBase = 2084 *0.8, nDamageRand = 2084 *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 2311 *0.8, nDamageRand = 2311 *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 2537 *0.8, nDamageRand = 2537 *0.4, nCostMana = 0},		--level 12			                                           
	{nDamageBase = 2764 *0.8, nDamageRand = 2764 *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 2990 *0.8, nDamageRand = 2990 *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 3217 *0.8, nDamageRand = 3217 *0.4, nCostMana = 0},		--level 15	
	{nDamageBase = 3443 *0.8, nDamageRand = 3443 *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 3670 *0.8, nDamageRand = 3670 *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 3897 *0.8, nDamageRand = 3897 *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 4123 *0.8, nDamageRand = 4123 *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 4350 *0.8, nDamageRand = 4350 *0.4, nCostMana = 0},		--level 20		
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode    = false;
	local dwSkillLevel	= skill.dwLevel
	
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,				
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
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
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- 技能施放的最大距离
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius       = 35 * LENGTH_BASE;
	skill.nTargetCountLimit	= 10;		--施法个数
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