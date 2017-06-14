------------------------------------------------
-- 文件名    :  万花_点血指_吟唱伤害.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-05-14 14:48	
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  点血指
-- 技能名称  :  吟唱伤害
-- 技能效果  :  吟唱造成直接伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
   {nCostMana = 36 , nDamage = 5, nDamageRand = 1},
	 {nCostMana = 67 , nDamage = 7, nDamageRand = 1},
	 {nCostMana = 97 , nDamage = 8, nDamageRand = 2},
	 {nCostMana = 120, nDamage = 21, nDamageRand = 4},
	 {nCostMana = 157, nDamage = 31, nDamageRand = 6},
	 {nCostMana = 187, nDamage = 41, nDamageRand = 8},
	 {nCostMana = 213, nDamage = 51, nDamageRand = 10},
	 {nCostMana = 225, nDamage = 61, nDamageRand = 12},
	 {nCostMana = 235, nDamage = 71, nDamageRand = 14},
	 {nCostMana = 243, nDamage = 80, nDamageRand = 16},
	 {nCostMana = 250, nDamage = 90, nDamageRand = 18},
	 {nCostMana = 278, nDamage = 100, nDamageRand = 20},
	 {nCostMana = 305, nDamage = 110, nDamageRand = 22},
	 {nCostMana = 332, nDamage = 120, nDamageRand = 24},
	 {nCostMana = 360, nDamage = 130, nDamageRand = 26},
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
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 15 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
    
    skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 40;										--子弹速度,点/帧
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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