--剑侠情缘网络版三 千秋万载 一统江湖
--武功技能
--少林-普渡棍法第二式-罗汉捧经
--技能效果简单说明：当条件满足时，方可释放，伤害中等。
--孟凡 2006-5-15

--------------厚道的分割线-----------------------------------------------------
tSkillData = 
{
    {nMaxRadius = 5},
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;

    ----------------- 设置Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, tSkillData[dwSkillLevel].nCoolDownID1);
	
    
    ----------------- 设置杂项参数 ----------------------------------------
   
    --升级经验
    --skill.dwLevelUpExp      = dwSkillLevel * 10 + 100;    
    --内力消耗
   -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;       
    --攻击半径，也就是攻击的有效距离
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    --skill.nAngleRange       = 128; 
    --吟唱帧数
   -- skill.nPrepareFrames    = 4;
    --子弹速度
    --skill.nBulletVelocity   = 3;
    --被打断的概率
   -- skill.nBreakRate        = 1000;
   
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return true;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com