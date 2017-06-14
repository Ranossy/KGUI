------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-6-4
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;

	for i = 1, 10 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,								-- 魔法属性
			4,															-- 属性值1
			10000															-- 属性值2
		);
   		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,								-- 魔法属性
			6,															-- 属性值1
			10000															-- 属性值2
		);
   		
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,								-- 魔法属性
			8,															-- 属性值1
			10000															-- 属性值2
		);  	
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
			ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF,								-- 魔法属性
			12,															-- 属性值1
			10000															-- 属性值2
		);
	end	
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
			ATTRIBUTE_TYPE.CALL_BUFF,								-- 魔法属性
			6300,															-- 属性值1
			1															-- 属性值2
		);	
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