------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : 陈翰林
-- 创建时间  : 2008-07-08
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 
-- 经脉效果  : 
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/经脉/VerationTable.lua")

tSkillData =
{
	{nPhysicsAttackPowerPercent = 10 },		
	{nPhysicsAttackPowerPercent = 20 },		
	{nPhysicsAttackPowerPercent = 30 },		
	{nPhysicsAttackPowerPercent = 41 },		
	{nPhysicsAttackPowerPercent = 51 },		
	{nPhysicsAttackPowerPercent = 61 },	
	{nPhysicsAttackPowerPercent = 71 },	
	{nPhysicsAttackPowerPercent = 82 },	
	{nPhysicsAttackPowerPercent = 92 },	
	{nPhysicsAttackPowerPercent = 102},				
};          
            
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
		tSkillData[dwSkillLevel].nPhysicsAttackPowerPercent,
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
	if skill.dwLevel == 10 then
		 player.AcquireAchievement(1423)
	end
	if player.GetSkillLevel(40) > 0 and player.GetSkillLevel(9) > 0  and player.GetSkillLevel(1206) > 0 and not player.IsAchievementAcquired(113) then
		player.AcquireAchievement(113)
	end
	player.AddAchievementCount(1422,2)
	
	local nAchi = 0
	for i = 1,10 do
		if player.GetSkillLevel(tVenationEffectID[i]) == 10 then
			nAchi = nAchi +1
		end
	end
	if nAchi >= 10 and not player.IsAchievementAcquired(127) then
		player.AcquireAchievement(127)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com