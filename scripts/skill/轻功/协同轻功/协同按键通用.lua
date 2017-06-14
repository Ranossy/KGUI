---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/协同轻功/协同按键通用.lua
-- 更新时间:	2016/8/25 23:23:01
-- 更新用户:	FENGMENGJIE
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/轻功/协同轻功/协同按键通用.lua", -- 属性值1
		0															--属性值2
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff
	
	skill.AddSlowCheckSelfBuff(7732, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckDestBuff(7732, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关	
	skill.AddSlowCheckSelfBuff(7525, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckDestBuff(7525, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckSelfBuff(7561, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckDestBuff(7561, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckSelfBuff(7911, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckDestBuff(7911, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关		
	skill.AddSlowCheckDestBuff(7723, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--攻防战相关
	skill.AddSlowCheckSelfBuff(10061, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--通用
	skill.AddSlowCheckDestBuff(10061, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--通用
	skill.AddSlowCheckDestBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--通用
	skill.AddSlowCheckDestBuff(10304, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--通用
	skill.AddSlowCheckDestBuff(10819, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--通用
	
	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

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

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
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
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

	if player.dwShapeShiftID ~= 0 then
		return false
	end	
	
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType and nTargetType == TARGET.PLAYER then
		local player_Target = GetPlayer(dwTargetID)
		if player_Target and player_Target.dwShapeShiftID ~= 0 then
			return false
		end
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--判断轻功
	if not player.bSprintFlag then
		return
	end
	
	--藏剑必须带着重剑
	if player.dwForceID == 8 then
		local item_BIG_SWORD = player.GetItem(INVENTORY_INDEX.EQUIP, EQUIPMENT_INVENTORY.BIG_SWORD)
		if not item_BIG_SWORD then
			return
		end
	end
	
	
	local nTargetType, nDwID = player.GetTarget()
	local noTarget = (nDwID == 0 or nDwID == dwCharacterID)
	--[[
	if player.dwJumpType ~= 9 then
		return
	end
	--]]
	--player.Talk(7800)
	if not noTarget and player.IsFollowController() == false then
		local bValue = true
		------------------------------------------
		--player.Talk(100)
		if nTargetType == 4 then
			local target = GetPlayer(nDwID)
			if target then
				local tBuff = {
					{10174, 0, }, --被长歌的控制 凭啥落雁
					{10802, 0, }, --双人秋千处理
					{11686, 0, }, --双人秋千处理2
					{11594, 0, },--战场背旗子
					{7732, 0, },--攻防战相关
					{7525, 0, },--攻防战相关
					{7561, 0, },--攻防战相关
					{7911, 0, },--攻防战相关
					{7723, 0, },--攻防战相关
					{10061, 0, },--通用
					{9506, 0, },--通用
					{10304, 0, },--通用
					{10819, 0, },--通用
					
					{9471, 0, },--背佛像
					{9469, 0, },--背木材
					{9470, 0, },--被香烛
					{9982, 0, },--可以被带飞
					{7867, 0, },--冷香丘箱子
					{7868, 0, },--冷香丘箱子
					
					--这里扩展其他BUFF检查吧
				}
				for i = 1, #tBuff do
					local buff = target.GetBuff(tBuff[i][1], tBuff[i][2])
					if buff then
						bValue = false
						--player.Talk(12345)
					end
				end
				
				--判断轻功
				if target.bSprintFlag then
					bValue = false
				end
	
				--换装
				if target.dwModelID ~= 0 then
					bValue = false
				end
				
				--登顶标记检查
				if target.bOnTowerFlag then
					bValue = false
				end
			
				--双人关系存在，不能使用表现动作
				if target.dwControllerID ~= 0 or target.dwFollowID ~= 0 then--是双人
					bValue = false
				end

			end
		end

		--if target.bOnTowerFlag then
		--bValue = false
		--end
		------------------------------------------
		if bValue then
			--player.Talk("冲刺")
			local tSkill_FORCE_SHUANGREN = {
				[1] = {16540, 1},
				[2] = {16541, 1},
				[3] = {16473, 1},
				[4] = {16542, 1},
				[5] = {16543, 1},
				[6] = {16544, 1},
				[7] = {16546, 1},
				[8] = {16545, 1},
				[9] = {17547, 1},
				[10] = {16547, 1},
				[21] = {16548, 1},
				[22] = {16549, 1},
				[23] = {16550, 1},
				}
			local tNow = tSkill_FORCE_SHUANGREN[player.dwForceID]
			if tNow then
				--player.Talk("冲刺" .. tNow[1])
				--print(player.CastSkill(tNow[1], tNow[2]))
				--player.Talk("999999999991111")
				if player.CastSkill(tNow[1], tNow[2]) == 1 then
				
					---------
					local nNumValue = 110 * 100--一次性消耗
					local nNumPoint = player.nSprintPower
					if nNumPoint ~= 0 then
						if nNumPoint > nNumValue then
							if not (player.nDisableSprintPowerCost > 0) then
								player.SetSprintPower(0, nNumPoint - nNumValue)--扣减气力值 0代表人,1代表马
							end
						else
							if not (player.nDisableSprintPowerCost > 0) then
								player.SetSprintPower(0, 0)
							end	
						end
					end	
					----------
				
					--player.Talk("冲刺44234242")		
					--处理一下目标的回神BUFF,允许死亡复活点被队友拉走
					local targetType, targetID = player.GetTarget()
					if targetType == TARGET.PLAYER then
						local dstPlayer = GetPlayer(targetID)
						if dstPlayer then
							local buff = dstPlayer.GetBuff(772, 1)
							if buff then
								dstPlayer.DelBuff(772, 1)
							end
							local buff1 = dstPlayer.GetBuff(961, 1)
							if buff1 then
								dstPlayer.DelBuff(961, 1)
							end
						end
					end
				end
			end
			return
		end
	end
	--if player.IsFollowController() == true then
		--if player.nJumpCount == 0 then

			--player.CastSkill(16503, 1)
		--elseif player.nJumpCount == 2 then

			--player.CastSkill(16504, 1)
		--elseif player.nJumpCount == 3 then

			--player.CastSkill(16505, 1)
		--end
	--end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com