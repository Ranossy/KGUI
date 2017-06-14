---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_招魂_子技能_驱散队友.lua
-- 更新时间:	2016/6/24 16:23:17
-- 更新用户:	wangwei2
-- 脚本说明:	15275
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/江湖百态/方士_招魂_子技能_驱散队友.lua",
		0
	);

	skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 6 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 6 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 10 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 25;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)
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

-------这个技能的作用目标是释放招魂技能的玩家的团队成员-------
function Apply(dwCharacterID, dwSkillSrcID)
	--print("驱散队友：")
	local wizard = GetPlayer(dwSkillSrcID)
	if not wizard then
		--print("没有施法者")
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		--print("没有队友")
		return
	end
	--print(player.szName)
	local buff = player.GetBuff(10842, 1)   --鬼魂附身BUFF
	if not buff then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local ghost = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID)
	if not ghost then		
		return
	end
	local fazhen = scene.GetNpcByNickName("FaZhen" .. wizard.dwID)
	if not fazhen then
		return
	end
	if ghost.GetCustomInteger1(8) == 1 then
		return
	end
	if ghost.GetBuff(10957, 1) then
		return
	end
	Identity_LonelyGhostSummon_Prepair(fazhen, wizard, ghost)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com