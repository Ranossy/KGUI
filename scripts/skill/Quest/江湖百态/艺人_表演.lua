---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/艺人_表演.lua
-- 更新时间:	2016/8/19 15:50:26
-- 更新用户:	YANGYUBO
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

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

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/江湖百态/艺人_表演.lua",
		0
	);

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
	--skill.AddSlowCheckSelfBuff(10819, 0, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 1 * LENGTH_BASE;		-- 技能施放的最大距离

	--------------------弹射配置参数----------------------------------------------
	--skill.nSkillBulletType = 1;					--子弹类型(苍云为1、霸刀为3)
	--skill.nSkillBulletSubType = 0;				--子弹的子类型,(和BulletType一起确定不同子弹的不同表现，取值范围0~256)
	--skill.nAnimationPlayFrame = 0 				--延迟消失帧数，这个为发射子弹后动画等待时间,即从子弹打到目标开始算起,这么多帧之后,发送sbsEnd消息给表现.
	--skill.nMaxHitCount = 1						--弹射技能的最大攻击次数
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 1 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)
	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
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
	--[[
	local scene = player.GetScene()
	if scene.nType == MAP_TYPE.DUNGEON and scene.dwMapID ~= 246 and scene.dwMapID ~= 258 and scene.dwMapID ~= 259 then
		return false
	end
	--]]
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
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not scene then
		return false, false
	end
	local nCurrentStamina = player.nCurrentStamina--获取玩家当前精力值
	if nCurrentStamina < 2 then
		player.ClearCDTime(1079)
		return false, false
	end
	local npc1 = scene.CreateNpc(51530, player.nX - 64 * 4, player.nY, player.nZ, 0, 2 * GLOBAL.GAME_FPS, "IdentityArtist_zuobiao1" .. player.dwID, player.dwID)--在玩家四个方向召唤四个NPC
	local npc2 = scene.CreateNpc(51530, player.nX + 64 * 4, player.nY, player.nZ, 0, 2 * GLOBAL.GAME_FPS, "IdentityArtist_zuobiao2" .. player.dwID, player.dwID)
	local npc3 = scene.CreateNpc(51530, player.nX, player.nY - 64 * 4, player.nZ, 0, 2 * GLOBAL.GAME_FPS, "IdentityArtist_zuobiao3" .. player.dwID, player.dwID)
	local npc4 = scene.CreateNpc(51530, player.nX, player.nY + 64 * 4, player.nZ, 0, 2 * GLOBAL.GAME_FPS, "IdentityArtist_zuobiao4" .. player.dwID, player.dwID)
	if npc1 and npc2 and npc3 and npc4 then
		player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/艺人_表演.lua", 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	local nMapId = scene.dwMapID
	local npc1 = scene.GetNpcByNickName("IdentityArtist_zuobiao1" .. player.dwID)
	local npc2 = scene.GetNpcByNickName("IdentityArtist_zuobiao2" .. player.dwID)
	local npc3 = scene.GetNpcByNickName("IdentityArtist_zuobiao3" .. player.dwID)
	local npc4 = scene.GetNpcByNickName("IdentityArtist_zuobiao4" .. player.dwID)
	if math.abs(player.nZ - npc1.nZ) >= 150 or math.abs(player.nZ - npc2.nZ) >= 150
		or math.abs(player.nZ - npc3.nZ) >= 150 or math.abs(player.nZ - npc4.nZ) >= 150 then--通过召唤NPC的Z轴判定玩家附近是否有高地
		player.SendSystemMessage(GetEditorString(10, 2014) )
		player.ClearCDTime(1079)
		return false, false
	end
	local place = CustomFunction.GetFrontNpcPosition(player.nX, player.nY, player.nFaceDirection, 64 * 2.5)--获取玩家前方四尺的位置
	player.StopCurrentEmotionAction()--打断玩家表情动作
	player.AddBuff(player.dwID, player.nLevel, 10819, 1)--添加无法移动的BUFF
	player.AddBuff(player.dwID, player.nLevel, 10951, 1)--添加无法播放切换武器动作的BUFF
	player.AddBuff(player.dwID, player.nLevel, 10970, 1)--添加防止弹窗的限制
	local npcControl1 = scene.GetNpcByNickName("biaoyanzongkong" .. player.dwID)--判断场景中是否已经有了
	if npcControl1 then
		scene.DestroyNpc(npcControl1.dwID)--有就删除总控
	end
	local npcControl = scene.CreateNpc(51720, player.nX, player.nY, player.nZ, player.nFaceDirection, 1800 * GLOBAL.GAME_FPS, "biaoyanzongkong" .. player.dwID, player.dwID)--召唤总控
	if npcControl then
		npcControl.SetCustomUnsigned4(0, player.dwID)--将玩家ID存入总控0号变量
	end
	local hualan = scene.GetDoodadByNickName("IdentityArtist_hualan" .. player.dwID)--判断场景中是否已经有了
	if hualan then
		scene.DestroyDoodad(hualan.dwID)--有就删除花篮
	end
	local doodad = scene.CreateDoodad(6086, place.nX, place.nY, player.nZ, place.nDir, "IdentityArtist_hualan" .. player.dwID)--在获取的位置召唤花篮
	doodad.SetCustomUnsigned4(0, player.dwID)--将表演者信息储存在DOODAD身上
	local wutai = scene.GetNpcByNickName("IdentityArtist_wutai" .. player.dwID)--判断场景中是否存在舞台
	if wutai then
		scene.DestroyNpc(wutai.dwID)--有就删除舞台
	end
	local npc = scene.CreateNpc(51504, player.nX, player.nY, player.nZ, player.nFaceDirection, - 1, "IdentityArtist_wutai" .. player.dwID)--在玩家当前位置创建舞台NPC
	doodad.SetCustomUnsigned4(4, npc.dwID)--将舞台NPC信息储存在DOODAD身上
	--新动态技能机制
	local tSkill = {16033, 16034, 16035, 16037, 16038, 16036, 16039, 16040, 16041, 16172, 16176}
	local tNewSkill = {}
	for _, dwSkillId in pairs(tSkill) do
		local nLevel = player.GetSkillLevel(dwSkillId)
		if nLevel > 0 then
			table.insert(tNewSkill, {nlevel = 1, id = dwSkillId})
		end
	end
	RemoteCallToClient(player.dwID, "OpenIdentityDynamicBar", PLAYER_IDENTITY_TYPE.ARTIST, tNewSkill)	--开启艺人技能
	local nFellowNum = 0
	local nTimeSlot = 30 * 60
	local tRank = {
		--[player.dwID] = {szName = player.szName, nNum = 0}
	}
	RemoteCallToClient(player.dwID, "OpenArtistRewardAmount", nFellowNum, nTimeSlot)--开启统计面板
	RemoteCallToClient(player.dwID, "SendIdentityArtistSkill")--请求客户端判断玩家是否有配置技能
	RemoteCallToClient(player.dwID, "CloseIdentityDynActBar")--关闭表演技能栏
	--添加成就--
	if nMapId == 108 then
		player.AddAchievementCount(5403, 1)
	end
	if nMapId == 6 then
		player.AddAchievementCount(5404, 1)
	end
	if nMapId == 194 then
		player.AddAchievementCount(5405, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com