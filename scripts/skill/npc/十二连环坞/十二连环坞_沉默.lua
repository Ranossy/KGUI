------------------------------------------------
-- 文件名    :  十二连环坞_沉默.lua
-- 创建人    :  陈步高	
-- 创建时间  :  2008-8-25
-- 用途(模块):  武功技能
-- 武功门派  :  十二连环坞
-- 武功类型  :  DeBuff
-- 技能名称  :  沉默
-- 技能效果  :  使目标无法攻击和施法；
------------------------------------------------

--------------脚本文件开始------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nBuffID = 669, nBuffLevel = 1, nCostMana = 0},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
 

----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetNormalCoolDown(1, 1);	--公共CD
   


	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 0;

    skill.nMinRadius		= 0			--技能施放最小半径
    skill.nMaxRadius        = 10 * LENGTH_BASE;	--技能施放最大半径
    skill.nAngleRange       = 128; 			--施放角度
    
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