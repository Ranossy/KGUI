------------------------------------------------
-- 文件名    : 辅助系_环通_增加气血最大值
-- 创建人    : zhangqi
-- 创建时间  : 2009-06-08
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
	{nMaxLifePercentAdd = 30 },		
	{nMaxLifePercentAdd = 61 },		
	{nMaxLifePercentAdd = 92 },		
	{nMaxLifePercentAdd = 123 },		
	{nMaxLifePercentAdd = 154 },		
	{nMaxLifePercentAdd = 184 },		
	{nMaxLifePercentAdd = 215 },		
	{nMaxLifePercentAdd = 246 },		
	{nMaxLifePercentAdd = 276 },		
	{nMaxLifePercentAdd = 307 },				
};          
            
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		tSkillData[dwSkillLevel].nMaxLifePercentAdd,
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
		 player.AcquireAchievement(124)
	end
	if player.GetSkillLevel(41) > 0 and player.GetSkillLevel(42) > 0  and player.GetSkillLevel(43) > 0 and not player.IsAchievementAcquired(115) then
		player.AcquireAchievement(115)
	end
	player.AddAchievementCount(1155,2)
	
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