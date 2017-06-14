------------------------------------------------
-- 文件名    :  关闭阵法.lua
-- 创建人    :  张奇	
-- 创建时间  :  2009-2-13
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.DETACH_MULTI_GROUP_BUFF,
        22,
        10000
    );
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
    --skill.SetPublicCoolDown(16);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	-- skill.nCostMana			= 0;
	
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0;										--技能施放最小半径
    skill.nMaxRadius        = 25 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius       = 25 * LENGTH_BASE;
--    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
    skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
    
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com