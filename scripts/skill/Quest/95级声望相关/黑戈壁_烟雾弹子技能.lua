---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/95级声望相关/黑戈壁_烟雾弹子技能.lua
-- 更新时间:	2015/10/8 1:45:21
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
local nPQID = 82
local tAnimal = {46993, }		--友善逃跑怪，一窝多个
local tSnake = {46994, 47631,}		--主动怪，一窝多个
local tHuman = {46634, 46635, 46636, 46637, 47632}	--主动怪，一窝一个
local tBoss = {46641, 46642, }	--BOSS怪，多窝一个
local tRepresentID = {
	[46993] = {48443,49160,49161},
	[46994] = {48444,49154,49155},
	[47631] = {49083,49156,49157},
}
local tSay = {
	[46634] = {GetEditorString(3, 2786), GetEditorString(8, 6443),GetEditorString(8, 6444),},
	[46635] = {GetEditorString(3, 2786), GetEditorString(8, 6445),},
	[46636] = {GetEditorString(3, 2786), GetEditorString(8, 6446),},
	[46637] = {GetEditorString(3, 2786), GetEditorString(2, 6488),},
	[46641] = {GetEditorString(3, 2786), GetEditorString(8, 6447),},
	[46642] = {GetEditorString(3, 2786), GetEditorString(8, 6448),},	
}

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
		"skill/Quest/95级声望相关/黑戈壁_烟雾弹子技能.lua", -- 属性值1
		0											-- 属性值2
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
	skill.nMinRadius = 1 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 60 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 5 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

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
	local npcTarget = GetNpc(dwCharacterID)
	local player = GetPlayer(dwSkillSrcID)
	if not npcTarget or not player then
		return
	end
	if npcTarget.dwTemplateID == 46995 and npcTarget.GetCustomInteger1(63) ~= 1 then	--单个刷怪
		npcTarget.SetCustomInteger1(63, 1)
		npcTarget.PlaySfx(1226, npcTarget.nX, npcTarget.nY, npcTarget.nZ, 0)
		RandomSoldierSpecy(npcTarget, 1, player)
		npcTarget.SetDisappearFrames(3 * GLOBAL.GAME_FPS, 1)	--烟雾标记NPC要进重生组
	elseif npcTarget.dwTemplateID == 46997 and npcTarget.GetCustomInteger1(63) ~= 1 then
		npcTarget.SetCustomInteger1(63, 1)
		npcTarget.PlaySfx(1227, npcTarget.nX, npcTarget.nY, npcTarget.nZ, 0)
		RandomSoldierSpecy(npcTarget, Random(2, 5), player)
		npcTarget.SetDisappearFrames(3 * GLOBAL.GAME_FPS, 1)	--烟雾标记NPC要进重生组
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function RandomSoldierSpecy(npcMaster, nNum, player)
	if not npcMaster or not nNum then
		return
	end
	if nNum < 1 then
		return
	end
	local nSum = nNum
	if nSum > 2 and Random(10000) < 5 then
		CreateSoldiers(npcMaster, tBoss, 1, nSum, player)
		nSum = nSum-1
		if not player.IsAchievementAcquired(5153) then	--成就“哎呀！快跑！”
			player.AddAchievementCount(5153, 1)					
		end
	end
	for i = 1, nSum do
		local nRate = Random(10000) / 100
		if nRate <= 25 then
			local nAnimal = Random(1, 4)
			CreateSoldiers(npcMaster, tAnimal, nAnimal, i, player)
			if not player.IsAchievementAcquired(5151) then	--成就“小动物召唤者”
				if not player.GetBuff(10163, 1) then
					player.AddBuff(0,99,10163, 1)
				end
				local buffAchieve = player.GetBuff(10163, 1)
				if buffAchieve then
					buffAchieve.nCustomValue = buffAchieve.nCustomValue+nAnimal
				end
			end
		elseif nRate <= 50 then
			local nSnake = Random(1, 6)
			CreateSoldiers(npcMaster, tSnake, nSnake, i, player)
			if not player.IsAchievementAcquired(5152) then	--成就“手气太差”
				if not player.GetBuff(10163, 2) then
					player.AddBuff(0,99,10163, 2)
				end
				local buffAchieve = player.GetBuff(10163, 2)
				if buffAchieve then
					buffAchieve.nCustomValue = buffAchieve.nCustomValue+nSnake
				end
			end
		else
			CreateSoldiers(npcMaster, tHuman, 1, i, player)
		end
	end
end

function CreateSoldiers(npcMaster, tTable, nNum, nCode, player)
	if not npcMaster or not tTable or not nNum then
		return
	end
	local scene = npcMaster.GetScene()
	if not scene then
		return
	end
	local nTargetTemplateID = tTable[Random(#tTable)]
	local nTargetRepresentID = 0
	if tRepresentID[nTargetTemplateID] then
		nTargetRepresentID = tRepresentID[nTargetTemplateID][Random(#tRepresentID[nTargetTemplateID])]
	end
	--print(nNum,nCode)
	for i = 1, nNum do
		local npcSoldier = scene.GetNpcByNickName("PQ82_" .. npcMaster.dwID .. "_" .. nCode .. "_" .. i)
		--print(i .. ":" .. Pos_X .. "," .. Pos_Y .. "," .. nFace)
		if not npcSoldier then
			local Pos_X = npcMaster.nX + Random(30) / 10 * 64 * math.cos(Random(256))
			local Pos_Y = npcMaster.nY + Random(30) / 10 * 64 * math.sin(Random(256))
			local nFace = GetFaceAngle(npcMaster.nX, npcMaster.nY, Pos_X, Pos_Y)
			--print(nFace)
			npcSoldier = scene.CreateNpc(nTargetTemplateID, Pos_X, Pos_Y, npcMaster.nZ, nFace, 60 * GLOBAL.GAME_FPS * 5, "PQ82_" .. npcMaster.dwID .. "_" .. nCode .. "_" .. i)
			if npcSoldier then
				npcSoldier.SetCustomInteger2(0, nPQID)
				if nTargetRepresentID ~= 0 then
					npcSoldier.SetModelID(nTargetRepresentID)
				end
				if tTable[1] == tAnimal[1] then
					local RunTo_Pos_X = npcSoldier.nX + 30 * 64 * math.cos(npcSoldier.nFaceDirection * math.pi * 2 / 256)
					local RunTo_Pos_Y = npcSoldier.nY + 30 * 64 * math.sin(npcSoldier.nFaceDirection * math.pi * 2 / 256)
					npcSoldier.RunTo(RunTo_Pos_X, RunTo_Pos_Y)
					npcSoldier.SetDisappearFrames(5 * GLOBAL.GAME_FPS)
				elseif player then
					npcSoldier.ModifyThreat(player.dwID, 100)
				end
				if tSay[nTargetTemplateID] then
					npcSoldier.AddBuff(0, 99, 10105, 1, 2)
					--npcSoldier.Say(tSay[nTargetTemplateID][#tSay[nTargetTemplateID]], 1280, true)
				end
			end
		end
	end
end

function GetFaceAngle(Pos_nX1, Pos_nY1, Pos_nX2, Pos_nY2)
	local xxNpc_2D_X = Pos_nX1 - Pos_nX2
	local xxNpc_2D_Y = Pos_nY1 - Pos_nY2
	local xxNpc_3D_X = math.sqrt(xxNpc_2D_X ^ 2 + xxNpc_2D_Y ^ 2)
	local xxNpc_Angle = math.deg(math.asin(math.abs(xxNpc_2D_X) / math.abs(xxNpc_3D_X)))
	if xxNpc_2D_X < 0 and xxNpc_2D_Y < 0 then
		xxNpc_Angle = 90 - xxNpc_Angle
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y <= 0 then
		xxNpc_Angle = xxNpc_Angle + 90
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = 90 - xxNpc_Angle + 180
	elseif xxNpc_2D_X <= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = xxNpc_Angle + 270
	end
	return math.floor(xxNpc_Angle / 360 * 255)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com