------------------------------------------------
-- 文件名    :  天策_技能事件_御_增加仇恨.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-9-19
-- 用途(模块):  武功技能
-- 武功门派  :  天策	
-- 武功类型  :  外功
-- 武功套路  :  是
-- 技能名称  :  技能事件
-- 技能效果  :  被击打后对目标增加大量仇恨
------------------------------------------------

tSkillData =
{
	{nThreat = 331  },		-- Level 1
	{nThreat = 452  },		-- Level 2
	{nThreat = 572  },		-- Level 3
	{nThreat = 693  },		-- Level 4
	{nThreat = 813  },		-- Level 5
	{nThreat = 933  },		-- Level 6

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
	
	--设置cool down------

	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab----------------

    -- skill.SetNormalCoolDown(1,7);
	
	--设置其他参数-------
  	----------------- 技能仇恨 -------------------------------------------------
	skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
  	
    --内力消耗
	--skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --攻击半径，也就是攻击的有效距离
 	skill.nMaxRadius        = 100* LENGTH_BASE;
  	skill.nAngleRange       = 256; 
 	skill.nAreaRadius		= 100* LENGTH_BASE;
    --吟唱帧数
  	--  skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --子弹速度
  	--  skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --被打断的概率
   	-- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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