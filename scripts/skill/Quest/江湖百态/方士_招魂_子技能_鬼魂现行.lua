---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_招魂_子技能_鬼魂现行.lua
-- 更新时间:	2016/7/1 12:06:06
-- 更新用户:	wangwei2
-- 脚本说明:	15275
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/江湖百态/方士_招魂_子技能_鬼魂现行.lua",
		0
	);

	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 6 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 6 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange	= 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius	= 10 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 30;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

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
function Apply(dwCharacterID, dwSkillSrcID)
	--print("召唤野鬼：----------", dwSkillSrcID)
	local fazhen = GetNpc(dwSkillSrcID)
	if not fazhen then
		return
	end
	local dwID = fazhen.GetCustomInteger4(1)
	local player = GetPlayer(dwID)
	if not player then
		return
	end
	local ghost = GetNpc(dwCharacterID)
	if not ghost then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if not ghost.GetBuff(10957, 1) and ghost.GetBuff(11081, 1) and ghost.GetCustomUnsigned2(Identity_Wizard.Ghost.ValueName.dwOwnerID) == player.dwID then
		Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)		
	end
--[[	if tGhostSummon_Data[ghost.dwTemplateID] then
		--该鬼魂没有正在被招魂,用BUFF标记
		if not ghost.GetBuff(10957, 1) then
			 --鬼魂类型：1.挖宝产出，2.系统预设，3.附身玩家,4.游荡鬼魂
			if ghost.GetCustomInteger1(0) == 1 then
				local dwGhostMaster_ID = ghost.GetCustomInteger4(1)  --鬼魂所属玩家的ID
				local dwWizard_ID = fazhen.GetCustomInteger4(1)
				if dwGhostMaster_ID == dwWizard_ID then
					--施法者自己的挖宝鬼魂
					Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
					return
				end
				local tPartyMember = player.GetPartyMemberList()
				if tPartyMember then
					for i = 1, #tPartyMember do
						if tPartyMember[i] == dwGhostMaster_ID then
							Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
							--施法者团队成员的挖宝鬼魂
							return
						end
					end
				end
			elseif ghost.GetCustomInteger1(0) == 2 or ghost.GetCustomInteger1(0) == 4 then
				Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
				return
			end
		end
	end--]]
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com