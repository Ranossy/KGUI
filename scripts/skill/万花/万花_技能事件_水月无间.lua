------------------------------------------------
-- 文件名    :  万花_技能事件_水月无间.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-09-05 19:17
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  外功
-- 武功套路  :  技能事件
-- 技能名称  : 	水月无间
-- 技能效果  :  使用技能后受到伤害并禁魔

-- 用到debuff54号

------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
     {nDamage = 20},
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local nSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
        tSkillData[nSkillLevel].nDamage,
        0
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF,
        449,
        1
    );
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetNormalCoolDown(1, 8);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[nSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;							--技能施放最大半径
    skill.nAngleRange       = 256; 										--施放角度为360°
    --skill.nAreaRadius		= 15 * LENGTH_BASE
    
    
    --skill.nPrepareFrames    = 32;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
    --skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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