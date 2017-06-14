---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/洛阳城北/技17037.lua
-- 更新时间:	2016/10/10 21:32:17
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

--	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/洛阳城北/技17037.lua", -- 属性值1
		0											-- 属性值2
	);

	skill.AddSlowCheckSelfBuff(11419, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	skill.SetNormalCoolDown(1, 1156);	--技能普通CD
	return true;
end
function Apply(dwCharacterID, dwSkillSrcID)
	print(GetEditorString(10, 9142), dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player or player.GetMapID()  ~= 239 then
		return
	end
	local buff = player.GetBuff(11417, 1)
	if not buff then
		return
	end
	local npc = GetNpc(buff.nCustomValue)
	if not npc then
		return
	end
	npc.FireAIEvent(2007,1,1)
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

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com