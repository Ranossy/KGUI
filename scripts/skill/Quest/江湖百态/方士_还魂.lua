---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_还魂.lua
-- 更新时间:	2016/6/8 16:59:09
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Domesticate/FellowPet.lua")
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/江湖百态/include/IdentityBaseFunc.lua")
Include("scripts/Map/寻宝系统/include/HoroSystem.lua")
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
----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/江湖百态/方士_还魂.lua", -- 属性值1
		0														-- 属性值2
	)

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
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 1057);	--技能普通CD，
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 32;				-- 吟唱帧数
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
	local scene = player.GetScene()
	if not scene then
		return SKILL_RESULT_CODE.FAILED
	end

	--防止通过/cast 出魂入定 重复使用技能
	if not player.GetBuff(10827,1) then
		return SKILL_RESULT_CODE.FAILED
	end
	
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
	--留下肉身，进入灵魂世界
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--数据中心需求，统计玩家单次变身的挖宝数量
	local buffChest = player.GetBuff(10826, 1)
	if buffChest then
		--player.GetPlayerIdentityManager().LogIdentityClosed(3, buffChest.nCustomValue)
	end
	--清除BUFF应该在离开动态技能栏脚本里-------
	--所有的回归都出发计时器脚本，走统一流程
	--player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_还魂.lua", 0, 1)
	player.DelBuff(10827, 1)
	if player.GetBuff(11494, 1) then
		player.DelBuff(11494, 1) --删除方士半透明buff
	end
	if player.GetBuff(2587, 1) then
		player.DelBuff(2587, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	
	if nParam2 == 1 then
		--黑屏
		--RemoteCallToClient(player.dwID, "EnableColorShift", false)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "PlayBgMusic", GetEditorString(10, 2197), nil, 2)  --取消锁定背景音乐
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "BgMusic_TryPlayBack")
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "reset default environment")	-- 还原天空盒
		--RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowFullScreenSFX", "WIZARD_VISIABLE_CLOSE")
		RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_OPEN")
		RemoteCallToClient(player.dwID, "SceneSfx", "Insert", {key = "WIZARD_VISIABLE_CLOSE", sfxid = "WIZARD_VISIABLE_CLOSE", px = -0.5, py = -0.2, pw = 2.0, ph = 1.4, loop = false})	
		player.SetTimer(2.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_还魂.lua", nParam1, 2)

		-- 打开出魂前玩家配置的影子效果
		RemoteCallToClient(player.dwID, "Restore3DOption", "IdentityWizard")	
	elseif nParam2 == 2 then    --本体被杀、出魂时间结束触发这里
		if player.GetBuff(2587, 1) then
			player.DelBuff(2587, 1)
		end
		--通用道具、buff、任务处理
		local tDelItemList = {
			27092, 27147,
		}
		for _, nItemId in pairs(tDelItemList) do
			local nAmount = player.GetItemAmountInAllPackages(5, nItemId)
			if nAmount >= 1 then
				player.CostItemInAllPackage(5, nItemId, nAmount)
			end
		end
		local tDelQuestList = {
			15738, 15792, 15765,
		}
		for _, nQuestId in pairs(tDelQuestList) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				player.SetQuestFailedFlag(nQuestIndex, 1)
			end
		end
		local tDelBuffList = {
			11128,
		}
		for _, nBuffId in pairs(tDelBuffList) do
			local buffDel = player.GetBuff(nBuffId, 1)
			if buffDel then
				player.DelBuff(nBuffId, 1)
			end
		end
		
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "SetBalloonGray", false)	-- 取消聊天泡泡灰色
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "reset default environment")	-- 还原天空盒
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "leave camera Post render")
		
		--切换技能栏时,灵魂状态标记BUFF和禁止传送BUFF就已经被删除了
		if IdentifyManager.dwCurrentIdentityType == PLAYER_IDENTITY_TYPE.WIZARD then     --如果依旧是方士身份，则给添加回动态技能栏。
			local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获取身份经验，						
			local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
			if nIdentifyLevel > 1 then
				--player.SetDynamicSkillGroup(263)
				RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3002)
			else
				local nQuestId_15462 = 15462 --一次性教学任务
				local nQuestIndex_15462 = player.GetQuestIndex(nQuestId_15462)
				local nQuestPhase_15462 = player.GetQuestPhase(nQuestId_15462)
				if nQuestIndex_15462 and nQuestPhase_15462 == 1 then
					--player.SetDynamicSkillGroup(263)
					RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3002)
				else
					--player.SetDynamicSkillGroup(294)
					RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3001)
				end
			end
			if scene.nType ~= 0 then
				--player.SetDynamicSkillGroup(0)        --仍然是方士,并且场景类型不对,清空动态技能栏				
				RemoteCallToClient(player.dwID, "CloseIdentityDynActBar")				
			end

			--新机制必须手动清除BUFF和位面信息
			if player.GetBuff(10826, 1) then
				player.DelBuff(10826, 1)
			end
			if player.GetBuff(10827, 1) then
				player.DelBuff(10827, 1)
			end
			if player.GetBuff(11494, 1) then
				player.DelBuff(11494, 1) --删除方士半透明buff
			end
			if player.GetBuff(2587, 1) then
				player.DelBuff(2587, 1)
			end			
			player.SetIdentityVisiableID(0)

		end
		local x = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1)
		local y = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5)
		local z = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9)
		local mapID = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13)
		if scene.dwMapID == mapID then    --在同一场景下才会传送
			if x > 0 and y > 0 and z > 0 then				
				--player.SetPosition(npc.nX, npc.nY, npc.nZ)
				if player.GetBuff(11438, 1) then -- 被BOSS念红尘技能波及会增加此buff，直接原地出外世界
					player.DelBuff(11438, 1)
				else
					player.SetPosition(x, y, z)
				end
			end	
			local nFace = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 17)
			if nFace then
				--调整镜头和面向与出窍前一致
				player.TurnTo(nFace)  	
				RemoteCallToClient(player.dwID, "OnChangeCameraYaw", nFace)
			end
		end

		--清空身份变量的存储坐标和地图。
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, 0)
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, 0)
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, 0)
		IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, 0)
		IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, 0)
	
		if nParam1 > 1 then
			if GetPlayer(nParam1) then
				player.dwFirstAttackPlayer = nParam1
				player.DieByKiller(nParam1)			
			else
				player.Die()
			end	
		elseif nParam1 == 1 then
			player.Die()
		end
				
		--教学处理
		local tQuestId = {15462, 15741}
		for _, nQuestId in pairs(tQuestId) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			local nQuestPhase = player.GetQuestPhase(nQuestId)
			if nQuestIndex and nQuestPhase == 1 then
				player.SetQuestValue(nQuestIndex, 0, 1)
			end
		end
		--特殊任务处理
		local nQuestId_15460 = 15460
		local nQuestIndex_15460 = player.GetQuestIndex(nQuestId_15460)
		local nQuestPhase_15460 = player.GetQuestPhase(nQuestId_15460)
		if nQuestIndex_15460 and nQuestPhase_15460 == 1 then
			player.SetQuestValue(nQuestIndex_15460, 2, 1)
		end
		--召唤真实宠物，跟随假宠物NPC回收
		local npcPet = scene.GetNpcByNickName("IdentityWizardLight" .. player.dwID)
		if npcPet then
			npcPet.SetDisappearFrames(1)
		end
		--[[
		local nFellowPetIndex = 208
		if player.IsFellowPetAcquired(nFellowPetIndex) then
			local dwPetId = player.dwFellowPetID
			local npc_pet = GetNpc(dwPetId)
			if not npc_pet then
				local dwNpcTemplateID = 51727
				OnCreateFellowPet(player, dwNpcTemplateID, nFellowPetIndex)
			end
		end
		--]]
	    local nQuestId_15784 = 15784
		local nQuestIndex_15784 = player.GetQuestIndex(nQuestId_15784)
		local nQuestPhase_15784 = player.GetQuestPhase(nQuestId_15784)
		if nQuestIndex_15784 and nQuestPhase_15784 == 1 then
			if player.GetItemAmount(5, 27134) == 1 then
				player.CostItemInAllPackage(5, 27134, 1)
			end
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 1202), 4)
		end
		--RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_CLOSE")
		--RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_OPEN")
		-- 挖宝点临时处理
		local npc_Dig = scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID)
		if npc_Dig then
			local nType = npc_Dig.GetCustomUnsigned1(0)
			if nType == 1 then
				RemoteCallToClient(player.dwID, "OpenSpringCompass")	-- 打开/关闭挖宝界面
				RemoteUpdateLocData(player)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com