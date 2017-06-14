---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_驱夜断愁.lua
-- 更新时间:	2016/1/8 9:44:29
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  郑海星
-- 创建时间	:  20120621
-- 效果备注	:  明教技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 137 * 0.95, nDamageRand = 137 * 0.1, nCostMana = 30 },
	{nDamageBase = 149 * 0.95, nDamageRand = 149 * 0.1, nCostMana = 50 },
	{nDamageBase = 161 * 0.95, nDamageRand = 161 * 0.1, nCostMana = 67 },
	{nDamageBase = 173 * 0.95, nDamageRand = 173 * 0.1, nCostMana = 93 },
	{nDamageBase = 185 * 0.95, nDamageRand = 185 * 0.1, nCostMana = 111},
	{nDamageBase = 197 * 0.95, nDamageRand = 197 * 0.1, nCostMana = 130},
	{nDamageBase = 209 * 0.95, nDamageRand = 209 * 0.1, nCostMana = 149},
	{nDamageBase = 221 * 0.95, nDamageRand = 221 * 0.1, nCostMana = 167},
	{nDamageBase = 233 * 0.95, nDamageRand = 233 * 0.1, nCostMana = 186},
	{nDamageBase = 245 * 0.95, nDamageRand = 245 * 0.1, nCostMana = 186},
	{nDamageBase = 257 * 0.95, nDamageRand = 257 * 0.1, nCostMana = 30 },
	{nDamageBase = 269 * 0.95, nDamageRand = 269 * 0.1, nCostMana = 50 },
	{nDamageBase = 281 * 0.95, nDamageRand = 281 * 0.1, nCostMana = 67 },
	{nDamageBase = 293 * 0.95, nDamageRand = 293 * 0.1, nCostMana = 93 },
	{nDamageBase = 305 * 0.95, nDamageRand = 305 * 0.1, nCostMana = 111},
	{nDamageBase = 317 * 0.95, nDamageRand = 317 * 0.1, nCostMana = 130},
	{nDamageBase = 329 * 0.95, nDamageRand = 329 * 0.1, nCostMana = 149},
	{nDamageBase = 341 * 0.95, nDamageRand = 341 * 0.1, nCostMana = 167},
	{nDamageBase = 353 * 0.95, nDamageRand = 353 * 0.1, nCostMana = 186},
	{nDamageBase = 365 * 0.95, nDamageRand = 365 * 0.1, nCostMana = 186},
	{nDamageBase = 377 * 0.95, nDamageRand = 377 * 0.1, nCostMana = 30 },
	{nDamageBase = 389 * 0.95, nDamageRand = 389 * 0.1, nCostMana = 50 },
	{nDamageBase = 401 * 0.95, nDamageRand = 401 * 0.1, nCostMana = 67 },
	{nDamageBase = 413 * 0.95, nDamageRand = 413 * 0.1, nCostMana = 93 },
	{nDamageBase = 425 * 0.95, nDamageRand = 425 * 0.1, nCostMana = 111},
	{nDamageBase = 437 * 0.95, nDamageRand = 437 * 0.1, nCostMana = 130},
	{nDamageBase = 449 * 0.95, nDamageRand = 449 * 0.1, nCostMana = 149},
	{nDamageBase = 461 * 0.95, nDamageRand = 461 * 0.1, nCostMana = 167},
	{nDamageBase = 473 * 0.95, nDamageRand = 473 * 0.1, nCostMana = 186},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		4709,
		1
		);
	--]]
	--添加buff记录目标ID
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_驱夜断愁.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MOON_ENERGY,
		6000,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_SUN_ENERGY,
		6000,
		0
	);
	--标记连击通用
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教通用删buff.lua",
		0
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			---正常伤害
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--4480,
	--dwSkillLevel
	--);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(4052, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 4057, dwSkillLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	skill.SetPublicCoolDown(503);		-- 明教公共CD 1秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 521);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--后跳公共CD
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
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
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
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3288)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	player.AddBuff(dwCharacterID, target.nLevel, 4709, 1)
	--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local life = target.nCurrentLife / target.nMaxLife
	local level = player.GetSkillLevel(3979)--正常
	--if player.GetSkillLevel(5980) == 1 then
	--player.AddBuff(dwCharacterID, player.nLevel, 5745, 1, 1)
	--end
	if player.GetBuff(5269, 1) then --背刺
		--print("beici1")
		player.CastSkill(4481, level)
	end
	if player.GetBuff(5269, 2) then--背刺
		--print("beici2")
		if player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			player.CastSkill(6258, level)
		else
			player.CastSkill(4482, level)
		end
		--player.CastSkill(4482, level)
	end
	if not player.GetBuff(5269, 1) and not player.GetBuff(5269, 2)  then
		--local level = player.GetSkillLevel(3979)--正常
		if player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			player.CastSkill(6257, level)
		else
			player.CastSkill(4480, level)
		end
		--print("nobeici")
	end
	if player.GetSkillLevel(5981) == 1 then
		if player.GetBuff(5882, 1) then
			player.DelBuff(5882, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5891, 1, 1)
		end
	end
	if player.GetSkillLevel(6724) == 1 then
		if life >= 0.7 then
			target.AddBuff(player.dwID, player.nLevel, 6283, 1, 1)
		end
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwSkillSrcID) then
		target = GetPlayer(dwSkillSrcID)
	else
		target = GetNpc(dwSkillSrcID)
	end
	if not target then
		return
	end
	local life = target.nCurrentLife / target.nMaxLife
	local level = player.GetSkillLevel(3979)--正常
	--if player.GetSkillLevel(5980) == 1 then
	--player.AddBuff(dwCharacterID, player.nLevel, 5745, 1, 1)
	--end
	if player.GetBuff(5269, 1) then --背刺
		--print("beici1")
		--player.CastSkill(4481, level)
		if IsPlayer(dwSkillSrcID) then
			player.CastSkill(4481, level, TARGET.PLAYER, dwSkillSrcID)
		else
			player.CastSkill(4481, level, TARGET.NPC, dwSkillSrcID)
		end
	end
	print(11111)
	if player.GetBuff(5269, 2) then--背刺
		--print("beici2")
		if	player.GetSkillLevel(5980) == 1 and life <= 0.4 then
			--player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(6258, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(6258, level, TARGET.NPC, dwSkillSrcID)
			end
		else
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(4482, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(4482, level, TARGET.NPC, dwSkillSrcID)
			end
		end
		--player.CastSkill(4482, level)
	end
	if not player.GetBuff(5269, 1) and not player.GetBuff(5269, 2)  then
		--local level = player.GetSkillLevel(3979)--正常
		if player.GetSkillLevel(5980) == 1 and life <= 0.4 then
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(6257, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(6257, level, TARGET.NPC, dwSkillSrcID)
			end
		else
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(4480, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(4480, level, TARGET.NPC, dwSkillSrcID)
			end
		end
		--print("nobeici")
	end
	if player.GetSkillLevel(5981) == 1 then
		if player.GetBuff(5882, 1) then
			player.DelBuff(5882, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5891, 1, 1)
		end
	end
	if player.GetSkillLevel(6724) == 1 then
		if life >= 0.7 then
			target.AddBuff(player.dwID, player.nLevel, 6283, 1, 1)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com