---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_招魂.lua
-- 更新时间:	2016/7/12 12:45:53
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
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
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/江湖百态/方士_招魂.lua", -- 属性值1
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
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 1056);	--技能普通CD
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
	skill.nCostStamina = 120;									-- 技能消耗的精力
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
	skill.nPrepareFrames = 48;				-- 吟唱帧数 15S
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval = 16; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame = 48;	 			-- 通道技持续时间，单位帧数
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
	return nPreResult
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
	player.SendSystemMessage(GetEditorString(10, 2201))
	local scene = player.GetScene()
	if not scene then
		return
	end
	-----教学任务Start-----
	local nQuestId = 15462
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if nQuestIndex and nQuestPhase == 1 and player.dwLastScriptID == GetFileNameHash("scripts/Map/江湖百态/方士/trap/活人却被逝者扰.lua") then --身上有任务并且在trap里招魂不消耗
		local npcFazhen = scene.GetNpcByNickName("identityfazhen" .. player.dwID)
		if not npcFazhen then
			npcFazhen = scene.CreateNpc(51531, 58227, 19587, 1083712, 19, 3 * 60 * GLOBAL.GAME_FPS, "identityfazhen" .. player.dwID, player.dwID, true)
		end
		local nSign = player.GetQuestValue(nQuestIndex, 7)
		player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 0, nSign)
		local nExp = player.GetPlayerIdentityManager().GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获取身份经验，
		local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
		if nIdentifyLevel <= 1 then
			--player.SetDynamicSkillGroup(294)
			RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3001)
		end
		return
	end
	-----教学任务End-----
	local nCount = 20
	if player.GetItemAmount(5, 26760) >= nCount then
		player.CostItem(5, 26760, nCount)
	else
		RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(10, 1618), "red")
		player.SendSystemMessage(GetEditorString(10, 1619))
		return
	end
	--创建表现NPC,1个法阵，8个阵眼,
	local fazhen = scene.GetNpcByNickName("FaZhen" .. player.dwID)
	if not fazhen then
		fazhen = scene.CreateNpc(51531, player.nX, player.nY, player.nZ, 64, 31 * GLOBAL.GAME_FPS, "FaZhen" .. player.dwID)  --player.nFaceDirection print(player.nFaceDirection)
		fazhen.AddBuff(player.dwID, player.nLevel, 10961, 1)
	else
		--要是已经存在法阵就把它传送到玩家当前位置，虽然不太可能
		fazhen.SetPosition(player.nX, player.nY, player.nZ)
		fazhen.AddBuff(player.dwID, player.nLevel, 10961, 1)
		fazhen.SetDisappearFrames(31 * GLOBAL.GAME_FPS)
	end
	fazhen.SetCustomInteger4(1, player.dwID)           ---法阵0：技能等级，1~4：释放者ID，5：释放技能的次数,6：是否被激活，7：是否增加过经验，8：施法者的方士等级,9:要召唤的鬼魂等级，与八卦阵界面相匹配，10：是否已经开启了八卦阵界面

	--计算出8个阵眼的相对坐标,256/8=32,360/8=45
	local radius = 5 --半径待定
	--local nDir = player.nFaceDirection * 2 * math.pi / 256 --面向从256转换成360°
	local nDir = 0 * 2 * math.pi / 256 --面向从256转换成360°
	for i = 1, 8 do
		local seDir = nDir + (i * 2 * math.pi / 8)
		--local seDir = i * 2 * math.pi / 8
		local N_X = player.nX + radius * 64 * math.cos(seDir)
		local N_Y = player.nY + radius * 64 * math.sin(seDir)
		local zhenyan = scene.GetNpcByNickName("ZhenYan" .. i .. player.dwID)
		if not zhenyan then
			zhenyan = scene.CreateNpc(51532, N_X, N_Y, player.nZ, player.nFaceDirection, 1.5 * GLOBAL.GAME_FPS, "ZhenYan" .. i .. player.dwID)
			if zhenyan then
				zhenyan.SetCustomInteger4(1, player.dwID)
				zhenyan.SetCustomInteger1(10, i)
			end
		else
			zhenyan.SetPosition(N_X, N_Y, player.nZ)
			zhenyan.SetDisappearFrames(1.5 * GLOBAL.GAME_FPS)
		end
	end
	player.CastSkill(16042, 1)
	--开启八卦阵界面
	--[[取到施法者的方士等级
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then                 --获得当前的身份
		return
	end
	local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --获得身份经验，						
	local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
	--]]
	--RemoteCallToClient(player.dwID, "JiangHuMatrix", "Open", 1, 6)  --2,6,40
end

function OnTimer(player, nParam1, nParam2)
	local nQuestId = 15462
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if not (nQuestIndex and nQuestPhase == 1) then
		return
	end
	local nSign = player.GetQuestValue(nQuestIndex, 7)
	if nParam2 ~= nSign then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcNangongqi = scene.GetNpcByNickName("nangongqi" .. player.dwID)
	if nParam1 == 0 then
		local npcGhost = scene.GetNpcByNickName("identity_teachghost" .. player.dwID)
		if not npcGhost then
			npcGhost = scene.CreateNpc(51592, 58433, 19656, 1083712, 14, 30 * 60 * GLOBAL.GAME_FPS, "identity_teachghost" .. player.dwID, player.dwID, true)
			npcGhost.SetCustomUnsigned4(0, player.dwID)
		end
		player.SetTimer(1.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 8, nSign)
	elseif nParam1 == 8 then
		local npcGhost = scene.GetNpcByNickName("identity_teachghost" .. player.dwID)
		if npcGhost then
			npcGhost.DoAction(0, 10071)
		end
		player.SetTimer(4 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 1, nSign)
	elseif nParam1 == 1 then
		if not npcNangongqi then
			npcNangongqi = scene.CreateNpc(51941, 58660, 19046, 1083712, 47, 2 * 60 * GLOBAL.GAME_FPS, "nangongqi" .. player.dwID, player.dwID)
			npcNangongqi.WalkTo(58121, 19280)
		end
		player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 2, nSign)
	elseif nParam1 == 2 then
		if npcNangongqi then
			npcNangongqi.SayTo(player.dwID, GetEditorString(10, 2502))
		end
		player.SetTimer(4 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 3, nSign)
	elseif nParam1 == 3 then
		if npcNangongqi then
			npcNangongqi.SayTo(player.dwID, GetEditorString(10, 2503))
		end
		player.SetTimer(4 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 4, nSign)
	elseif nParam1 == 4 then
		if npcNangongqi then
			npcNangongqi.WalkTo(58121, 19280)
		end
		player.SetTimer(10 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 5, nSign)
	elseif nParam1 == 5 then
		if npcNangongqi then
			--npcNangongqi.PlaySfx(1366, npcNangongqi.nX, npcNangongqi.nY, npcNangongqi.nZ)
			npcNangongqi.SayTo(player.dwID, GetEditorString(10, 2536))
			npcNangongqi.TurnTo(47)
		end
		local npcZhenyan = scene.GetNpcByNickName("zhenyan" .. player.dwID)
		if not npcZhenyan then
			npcZhenyan = scene.CreateNpc(51946, 58121, 19280, 1083776, 47, 10 * GLOBAL.GAME_FPS, "zhenyan" .. player.dwID, player.dwID)
		end
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2287), 3)
		player.SendSystemMessage(GetEditorString(10, 2287))
		local npcGhost = scene.GetNpcByNickName("identity_teachghost" .. player.dwID)
		if npcGhost then
			player.PlaySfx(1353, npcGhost.nX, npcGhost.nY, npcGhost.nZ + 700)   --现实世界里鬼魂出现的特效
			npcGhost.AddBuff(npcGhost.dwID, npcGhost.nLevel, 10846, 1)  --鬼魂身上的烟雾特效
		end
		player.SetTimer(5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 6, nSign)
	elseif nParam1 == 6 then
		local npcGhost = scene.GetNpcByNickName("identity_teachghost" .. player.dwID)
		if npcGhost then
			npcGhost.DoAction(0, 10063)
		end
		local npcFazhen = scene.GetNpcByNickName("identityfazhen" .. player.dwID)
		if npcFazhen then
			npcFazhen.SetDisappearFrames(1)
		end
		local npcZhenyan = scene.GetNpcByNickName("zhenyan" .. player.dwID)
		if npcZhenyan then
			npcZhenyan.SetDisappearFrames(1)
		end
		player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 7, nSign)
	elseif nParam1 == 7 then
		local npcGhost = scene.GetNpcByNickName("identity_teachghost" .. player.dwID)
		if npcGhost then
			npcGhost.DoAction(0, 0)
			npcGhost.SetForceID(28)
			npcGhost.ModifyThreat(player.dwID, 10000)
		end
		player.SetQuestValue(nQuestIndex, 1, 1)
		if npcNangongqi then
			npcNangongqi.SayTo(player.dwID, GetEditorString(10, 2537))
		end
		player.SetTimer(5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_招魂.lua", 9, nSign)
	elseif nParam1 == 9 then
		if npcNangongqi then
			npcNangongqi.SayTo(player.dwID, GetEditorString(10, 2538))
			npcNangongqi.WalkTo(58660, 19046)
			npcNangongqi.SetDisappearFrames(5 * GLOBAL.GAME_FPS)
		end
	end
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com