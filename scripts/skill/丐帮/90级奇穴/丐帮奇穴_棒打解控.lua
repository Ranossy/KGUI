---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/90级奇穴/丐帮奇穴_棒打解控.lua
-- 更新时间:	2017/3/21 18:19:20
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪
-- 创建时间	:  2013-6-7
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		2,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		6370,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/丐帮/90级奇穴/丐帮奇穴_棒打解控.lua",
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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--print(11111111)
	local nRnd = Random(1, 10000)
	if nRnd <= 3000 then
		player.ClearCDTime(621)
		player.ClearCDTime(606)
		player.ClearCDTime(88)
		if player.GetSkillLevel(6834) == 1 then
			player.ClearCDTime(1192)
		--	player.ClearCDTime(1194)
		end
		ModityCDToUI(player, 5269, 0, 0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com