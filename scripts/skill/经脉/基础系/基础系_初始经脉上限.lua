------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi
-- 创建时间  : 2009-08-05
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
	{nTrain = 100000 },				
	
};          
            
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	          
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.MAX_TRAIN_VALUE,
		tSkillData[dwSkillLevel].nTrain,
		0       
	);
	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.MAX_MANA_ADDITIONAL,
--		tSkillData[dwSkillLevel].nMP,
--		0
--	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
--		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
--		"skill/经脉/基础系/基础系_初始经脉上限.lua",
--		0
--	);



   
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
end

function Apply(dwCharacterID)
	--local player= GetPlayer(dwCharacterID)
	--if player.nMaxTrainValue >=4500 and not player.IsAchievementAcquired(105) then
	--	player.AcquireAchievement(105)
	--end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com