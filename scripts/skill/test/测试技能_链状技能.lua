------------------------------------------------
-- 文件名    :  江湖功夫_进阶攻击.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-9-14
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  江湖功夫
-- 技能名称  :  回风扫叶
-- 技能效果  :  对目标造成若干点技能伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData ={
	{nDamageBase = 14, nDamageRand = 7, 	nCostMana = 12},
	{nDamageBase = 23, 	nDamageRand = 12,	nCostMana = 16},
	{nDamageBase = 31, 	nDamageRand = 16,	nCostMana = 25},
	{nDamageBase = 40, 	nDamageRand = 20,	nCostMana = 35},
	{nDamageBase = 49, 	nDamageRand = 25,	nCostMana = 50},
	
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT, 
        -1024,
        0
    );

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
	
	skill.nWeaponDamagePercent = 0		--去除武器影响
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);	--公共CD
    skill.SetNormalCoolDown(1, 59);	--CD5秒
    skill.SetNormalCoolDown(2, 91);
    
    --破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.MIDDLE
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	----------------- 链状技能相关 ---------------------------------------------
    skill.nChainBranch	= 3;					--链状技能分支数
    skill.nChainDepth	= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    skill.nMinRadius		= MELEE_ATTACK_DISTANCE;					-- 技能施放的最小距离 
	skill.nMaxRadius		= 20 * LENGTH_BASE;							-- 技能施放的最大距离
    skill.nAngleRange     = 85; 										--施放角度120°
    
    --skill.nAreaRadius 		= 4 * LENGTH_BASE;							--作用范围
    --skill.nTargetCountLimit = 8											--最多8个单位
    
    --skill.nPrepareFrames  = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity = 12;										--子弹速度,点/帧
    
    --skill.nBreakRate      = 1024;										--被打断的概率,默认1024表示一定被打断
   
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