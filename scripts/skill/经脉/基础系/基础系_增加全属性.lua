------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : CBG
-- 创建时间  : 2010-07-26
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 
-- 经脉效果  : 
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


tSkillData =
{
	{nBase = 1,  nSpunk = 2,  nStrength = 2,  nAgility = 2,  nVitality = 2 },		
	{nBase = 2,  nSpunk = 4,  nStrength = 4,  nAgility = 4,  nVitality = 4 },		
	{nBase = 3,  nSpunk = 6,  nStrength = 6,  nAgility = 6,  nVitality = 6 },		
	{nBase = 4,  nSpunk = 8,  nStrength = 8,  nAgility = 8,  nVitality = 8 },		
	{nBase = 5,  nSpunk = 10, nStrength = 10, nAgility = 10, nVitality = 10},				
};          
            
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.BASE_POTENTIAL_ADD,
		tSkillData[dwSkillLevel].nBase,
		0       
	);
	
    return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == 1 then
		 player.AcquireAchievement(109)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com