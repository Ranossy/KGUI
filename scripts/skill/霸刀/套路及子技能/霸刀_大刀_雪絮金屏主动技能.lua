---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/套路及子技能/霸刀_大刀_雪絮金屏主动技能.lua
-- 更新时间:	2016/9/20 10:41:25
-- 更新用户:	mengxiangfei11
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

	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL, -- 魔法属性
		16845, -- 属性值1
		dwSkillLevel											-- 属性值2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/霸刀/套路及子技能/霸刀_大刀_雪絮金屏主动技能.lua", -- 属性值1
		0											-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--霸刀大刀旋转
	skill.AddSlowCheckSelfBuff(10816, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);	--霸刀鞘刀姿态Buff
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
	skill.SetNormalCoolDown(1, 1136);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
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
	skill.nCostSunEnergy = 10;							-- 技能消耗的日能量
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
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
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
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local nTime = 4
	if player.GetSkillLevel(17047) == 1 then
		nTime = nTime + 2
	end
	
	local npc_qiqiang = scene.CreateNpcWithEmployerID(53803, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * nTime, player.dwID, false, player.dwIdentityVisiableID)
	if npc_qiqiang then
		player.SetTimer(2, "scripts/skill/霸刀/套路及子技能/霸刀_大刀_雪絮金屏主动技能.lua", npc_qiqiang.dwID, nTime)
		npc_qiqiang.SetRelationProxyID(player.dwID)
		--[[
		--气墙推人眩晕
		if player.GetSkillLevel(16911) == 1 then
			npc_qiqiang.AddBuff(player.dwID, player.nLevel, 11450, 1)
			local nbuff = npc_qiqiang.GetBuff(11450, 1)
			if nbuff then
				nbuff.nCustomValue = 1
			end
		end
		
		--保护Npc不被发现且无敌
		npc_qiqiang.AddBuff(player.dwID, player.nLevel, 11250, 1)
		--]]
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	local npc_qiqiang = GetNpc(nParam1)
	if not npc_qiqiang then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	if player.GetSkillLevel(17047) == 1 then
		--6秒表现
		player.PlaySfx(1536, npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nZ, npc_qiqiang.nFaceDirection * 360 / 256)
	else
		--4秒表现
		player.PlaySfx(1523, npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nZ, npc_qiqiang.nFaceDirection * 360 / 256)
	end
	local Dst_X, Dst_Y = GetDestinationPoint(npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nFaceDirection, 20 * 64)
	if player.GetSkillLevel(16957) == 1 then
		local QQ_List = player.GetAdvancedDynamicObstacleList(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8)
		if #QQ_List ~= 0 then
			for i = 1, #QQ_List do
				--print("i"..i)
				--print(QQ_List[i].dwIndex)
				--print(QQ_List[i].dwPlayerID)
				if IsEnemy(player.dwID, QQ_List[i].dwPlayerID) then
					local target = GetPlayer(QQ_List[i].dwPlayerID)
					if target then
						for j = 1, 4 do
							local nbuff_index = target.GetBuff(11469 + j, 1)
							if nbuff_index and nbuff_index.nCustomValue == QQ_List[i].dwIndex then
								local nbuff_mark = target.GetBuff(11465 + j, 1)
								if nbuff_mark then
									local npc_mark = GetNpc(nbuff_mark.nCustomValue)
									if npc_mark then
										npc_mark.SetDisappearFrames(1, 0)
									end
								end
								target.DelBuff(11469 + j, 1)
								target.DelBuff(11465 + j, 1)
								break
							end
						end
					end
					player.RemoveAdvancedDynamicObstacle(player.nX, player.nY, QQ_List[i].dwIndex)
				end
			end
		end
	else
		local nIndex = 0
		if player.GetSkillLevel(17047) == 1 then
			nIndex = player.AddAdvancedDynamicObstacle(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8, 96, ADVANCED_DYNAMIC_OBSTACLE_TYPE.ONLY_ENEMY)
		else
			nIndex = player.AddAdvancedDynamicObstacle(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8, 64, ADVANCED_DYNAMIC_OBSTACLE_TYPE.ONLY_ENEMY)
		end

		if player.GetSkillLevel(16911) == 1 then
			local Mid_X, Mid_Y = GetDestinationPoint(npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nFaceDirection, 10 * 64)
			local nFaceDir = 0
			if npc_qiqiang.nFaceDirection + 64 >= 256 then
				nFaceDir = npc_qiqiang.nFaceDirection + 64 - 256
			else
				nFaceDir = npc_qiqiang.nFaceDirection + 64
			end
			local npc_mid = scene.CreateNpcWithEmployerID(53803, Mid_X, Mid_Y, npc_qiqiang.nZ, nFaceDir, 16 * nParam2, player.dwID, false, player.dwIdentityVisiableID)
			if npc_mid then
				npc_mid.SetRelationProxyID(player.dwID)
				npc_mid.AddBuff(player.dwID, player.nLevel, 4339, 1, 20)
				
				--气墙推人眩晕
				npc_mid.AddBuff(player.dwID, player.nLevel, 11450, 1)
				local nbuff = npc_mid.GetBuff(11450, 1)
				if nbuff then
					nbuff.nCustomValue = 1
				end

				--保护Npc不被发现且无敌
				npc_mid.AddBuff(player.dwID, player.nLevel, 11250, 1)

				for i = 1, 4 do
					if not player.GetBuff(11465 + i, 1) then
						player.AddBuff(player.dwID, player.nLevel, 11465 + i, 1, 4)
						local nbuff_mark = player.GetBuff(11465 + i, 1)
						if nbuff_mark then
							nbuff_mark.nCustomValue = npc_mid.dwID
						end
						
						player.AddBuff(player.dwID, player.nLevel, 11469 + i, 1, 4)
						local nbuff_index = player.GetBuff(11469 + i, 1)
						if nbuff_index then
							nbuff_index.nCustomValue = nIndex
						end
		
						break
					end
				end
			end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com