------------------------------------------------
-- 文件名    :  万花_轻功_震地拔冲_效果.lua
-- 创建人    :  刘欣
-- 创建时间  :  2008-3-7
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  万花轻功
-- 技能名称  :  震地拔冲
-- 技能效果  :  向自己的后方快速移动，起跳时会造成范围伤害,不能命中跳跃中的目标
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nNeutralDamage = 55 ,nNeutralDamageRand = 5},
	{nNeutralDamage = 90 ,nNeutralDamageRand = 10},
	{nNeutralDamage = 125,nNeutralDamageRand = 15},
	{nNeutralDamage = 160,nNeutralDamageRand = 20},
	{nNeutralDamage = 195,nNeutralDamageRand = 20},
	{nNeutralDamage = 230,nNeutralDamageRand = 20}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;
    
    skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        	ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, 
        	tSkillData[dwSkillLevel].nNeutralDamage, 
        	0
    );
    
    skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        	ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, 
        	tSkillData[dwSkillLevel].nNeutralDamageRand, 
        	0
    );
	
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, 
        	0, 
        	0
    );
    
--    if dwSkillLevel >= 5 then
--    	skill.BindBuff(1, 998, 1)--眩晕效果
--    end								--2009.6.29去掉定身效果
	
    ----------------- 设置Cool down ---------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetNormalCoolDown(1, 8);
	
    ----------------- 设置杂项参数 ----------------------------------------  

    --攻击半径，也就是攻击的有效距离
    --skill.nMaxRadius        = 4 * LENGTH_BASE;
    skill.nAngleRange       = 256; 
	skill.nAreaRadius	=	8 * LENGTH_BASE;
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    skill.nBulletVelocity   = 0;
    --被打断的概率
    skill.nDismountingRate		= PERCENT_BASE;					-- 将目标击落下马几率,基数1024，默认0	2008年6月27日CBG						
  
    skill.nBreakRate        = 0;
   
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