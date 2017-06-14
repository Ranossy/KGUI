------------------------------------------------
-- 文件名    :  十二连环坞_侮辱谩骂.lua
-- 创建人    :  陈步高	
-- 创建时间  :  2008-8-25
-- 用途(模块):  武功技能
-- 武功门派  :  NPC
-- 武功类型  :  DeBuff
-- 技能名称  :  侮辱谩骂
-- 技能效果  :  增加目标X点攻击力和增加目标攻击落空几率
------------------------------------------------

--------------脚本文件开始------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
         {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 1},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 2},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 3},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 4},
         {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 5},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 6},
         {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 7},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 8},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 9},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 10},
         {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 11},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 12},
         {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 13},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 14},
	 {nCostMana = 0, nMaxRadius = 10, nAngleRange = 256, nBreakRate = 0, nBuffID = 668, nBuffLevel = 15}, 
};


--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--设置DeBuff---------	

skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
 
	
--设置cool down------

--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--设置其他参数-------
  
    --内力消耗
    --skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --攻击半径，也就是攻击的有效距离
   skill.nMinRadius		= 0 * LENGTH_BASE;
      skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    -- 攻击范围的扇形角度范围 
  skill.nAngleRange       = 128; 
    --吟唱帧数
    skill.nPrepareFrames    = 0;
    --子弹速度
    --skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --被打断的概率
    --skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--npc: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com