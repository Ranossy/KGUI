---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Default.lua
-- 更新时间:	2015/7/29 14:31:27
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--设置武功技能级别相关数值


	----------------- 魔法属性 -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- 属性作用模式
   		ATTRIBUTE_TYPE.nAttributeKey,								-- 魔法属性
   		nAttributeValue1,											-- 属性值1
   		nAttributeValue2											-- 属性值2
   		);
    --]]

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

	-----------------技能施放姿态需求(苍云)----------------------------------------
	--skill.nNeedPoseState = 1    --检查姿态，1为擎刀姿态，2为擎盾姿态

	----------------技能伤害给小队回血------------------------------------------

	--skill.nDamageToLifeForParty = 0	--技能伤害给小队成员百分比回血

	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	--skill.nCostManaBasePercent = 0;							-- 技能消耗的内力百分比
	--skill.nCostRage = 0;							-- 技能消耗的怒气
	--skill.nCostEnergy = 0;							-- 技能消耗的能量
	--skill.nCostSunEnergy = 0;							-- 技能消耗的日能量
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 这里为true时,表示全部消耗豆点
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)



--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local X1 = player.nX
	local Y1 = player.nY
	local H = 50
	local F = player.nFaceDirection
	local X2 = X1 + H * math.cos(F/128 * math.pi)
	local Y2 = Y1 + H * math.sin(F / 128 * math.pi)
	player.PlaySfx(1517, X2, Y2, player.nZ, 360 * player.nFaceDirection / 256)
	if player.nMoveState == MOVE_STATE.ON_RUN then
		player.PlaySfx(1518, player.nX + 32, player.nY, player.nZ)
		--player.PlaySfx(1519, player.nX, player.nY, player.nZ)
		player.SetTimer(0.4 * GLOBAL.GAME_FPS, "scripts/skill/item/苍云特殊武器_火焰踏步.lua", X1, Y1)
	
	end
end

function OnTimer(player, nParam1, nParam2)
	player.CastSkillXYZ(16968, 1, nParam1, nParam2, player.nZ)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com