---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_贴符判断.lua
-- 更新时间:	2016/8/11 17:45:56
-- 更新用户:	lilin101
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")
Include("scripts/Map/江湖百态/include/IdentityBaseFunc.lua")

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

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	
   	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/江湖百态/方士_贴符判断.lua",
		0
	);
    

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
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 这里为true时,表示全部消耗豆点
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离

	--------------------弹射配置参数----------------------------------------------
	--skill.nSkillBulletType = 1;					--子弹类型(苍云为1、霸刀为3)
	--skill.nSkillBulletSubType = 0;				--子弹的子类型,(和BulletType一起确定不同子弹的不同表现，取值范围0~256)
	--skill.nAnimationPlayFrame = 0 				--延迟消失帧数，这个为发射子弹后动画等待时间,即从子弹打到目标开始算起,这么多帧之后,发送sbsEnd消息给表现.
	--skill.nMaxHitCount = 1						--弹射技能的最大攻击次数
	--skill.nMaxHitRadius = 1 * 64					--距离释放者的最大距离限定
	--skill.nMaxHoodleRadius = 10 * LENGTH_BASE  	--弹射搜索距离
	--skill.nMaxSearchCount = 1 					--是否限制弹射目标(0为不限 1为只打一个目标)
	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
	--skill.bInstantChannel = false;				-- 通道技能是否立刻造成一次伤害
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local nAmount = player.GetItemAmount(5, 27735)
	if nAmount == 0 then
		nAmount = player.GetItemAmount(5, 26760)
	end
	if nAmount < 1 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4493), 4)
		return
	end

--[[	local buff = npc.GetBuff(Identity_Wizard.BuffList.SummonFlag.dwID, 0)
	if not buff then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "目标无需锁灵封印", 5)
		return
	end--]]
	if npc.dwTemplateID ~= 51501 then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4494), 5)
		return
	end
	if npc.GetBuff(Identity_Wizard.BuffList.Rune.dwID, Identity_Wizard.BuffList.Rune.nLevel) then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4495), 5)
		return
	end
	local nExp = player.GetPlayerIdentityManager().GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获取身份经验，
	local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
	--[[if nIdentifyLevel < buff.nLevel then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "方士等级不够，无法对其锁灵封印", 5)
		return
	end--]]
	if player.nCurrentStamina < 20 or not player.CanCostStamina() then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4579), 5)
		return
	end
	if scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID) then
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "同一时间只能封印一个藏宝堆和魂灵。", 4)
		RemoteCallToClient(player.dwID, "OnMessageBoxRequest", 32, GetEditorString(10, 9436), GetEditorString(9, 9166), GetEditorString(4, 823), npc.dwID)
		return
	end
	player.DoAction(0, 60063)
	player.DoCustomOTAction(0, 1, 5 * GLOBAL.GAME_FPS, TARGET.NPC, npc.dwID,
			"scripts/skill/Quest/江湖百态/方士_贴符判断.lua", GetEditorString(10, 2685))
end

function OnCustomEvent(player, npc)
	player.DoAction(0, 60064)
	player.SetTimer(1, "scripts/skill/Quest/江湖百态/方士_贴符判断.lua", npc.dwID, 0)
end

function OnTimer(player, nParam1, nParam2)
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.NPC or dwTargetID ~= nParam1 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 5252), 5)
		return
	end
	local npc = GetNpc(nParam1)
	if not npc then
		return
	end
--[[	local buff = npc.GetBuff(Identity_Wizard.BuffList.SummonFlag.dwID, 1)
	if not buff then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "目标无需锁灵封印", 5)
		return
	end--]]
	if npc.dwTemplateID ~= 51501 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4494), 5)
		return
	end
	if npc.GetBuff(Identity_Wizard.BuffList.Rune.dwID, Identity_Wizard.BuffList.Rune.nLevel) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4495), 5)
		return
	end
	local nExp = player.GetPlayerIdentityManager().GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获取身份经验，
	local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
--[[	if nIdentifyLevel < buff.nLevel then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "方士等级不够，无法对其锁灵封印", 5)
		return
	end--]]
	local nAmount = player.GetItemAmount(5, 27735)
	if nAmount == 0 then
		nAmount = player.GetItemAmount(5, 26760)
	end
	if nAmount < 1 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4493), 4)
		return
	end
	if player.nCurrentStamina < 20 or not player.CanCostStamina() then
		RemoteCallToClient(dwSkillSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 4579), 5)
		return
	end
	--player.AddStamina( - 20)
	--player.SendSystemMessage("消耗20点精力。")--]]
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID) then
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "同一时间只能封印一个藏宝堆和魂灵。", 4)
		RemoteCallToClient(player.dwID, "OnMessageBoxRequest", 32, GetEditorString(10, 9436), GetEditorString(9, 9166), GetEditorString(4, 823), nParam1)
		return
	end
--[[	local dwFellowID = npc.GetCustomInteger4(Identity_Wizard.Ghost.ValueName.nFellowID)
	local player_Fellow = GetPlayer(dwFellowID)
	if player_Fellow then
		if not IsParty(player.dwID, player_Fellow.dwID) then
			RemoteCallToClient(
				player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED",
				string.format("此魂灵浑浑噩噩，正在跟随%s，需和%s侠士组队方可贴符封印。",
				player_Fellow.szName, player_Fellow.szName), 4
			)
			player.SendSystemMessage(
				string.format("此魂灵浑浑噩噩，正在跟随%s，需和%s侠士组队方可贴符封印。",
				player_Fellow.szName, player_Fellow.szName)
				)
			return
		end
	end--]]
	--player.CostItemInAllPackage(5, 26760, 1)
	player.CastSkill(16411, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com