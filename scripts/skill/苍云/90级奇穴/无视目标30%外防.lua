---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/无视目标30%外防.lua
-- 更新时间:	2015/9/25 9:18:10
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 13110  or skill.dwSkillID == 13107 or skill.dwSkillID == 13108 or skill.dwSkillID == 13106 or
	   skill.dwSkillID == 13160  or skill.dwSkillID == 13099 or skill.dwSkillID == 13156 or skill.dwSkillID == 13100 or
	   skill.dwSkillID == 13075  or skill.dwSkillID == 13076 or skill.dwSkillID == 13077 or skill.dwSkillID == 13078 or
	   skill.dwSkillID == 13079  or skill.dwSkillID == 13080 or skill.dwSkillID == 13081 or skill.dwSkillID == 13082 or
	   skill.dwSkillID == 13083  or skill.dwSkillID == 13084 or skill.dwSkillID == 13085 or skill.dwSkillID == 13092 or
	   skill.dwSkillID == 13093  or skill.dwSkillID == 13463 or skill.dwSkillID == 13464 or skill.dwSkillID == 13206 or
	   skill.dwSkillID == 13044  or skill.dwSkillID == 13244 or skill.dwSkillID == 13060 or skill.dwSkillID == 13119 or
	   skill.dwSkillID == 13164  or skill.dwSkillID == 13453 or skill.dwSkillID == 13052 or skill.dwSkillID == 13276 or
		skill.dwSkillID == 13161  or skill.dwSkillID == 13045 then
     	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_SHIELD_PERCENT,
        -512, 
        0
		);
		end
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com