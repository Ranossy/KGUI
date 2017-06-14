---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_花月别院/花月别院_3号_红色射线.lua
-- 更新时间:	2015/6/2 10:10:40
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 14000, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 29300, nDamageRand = 0, nCostMana = 0}, --level 2
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
	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/npc/副本BOSS/永王行宫_花月别院/花月别院_3号_红色射线.lua", --属性值1
		0															--属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	skill.AddSlowCheckDestBuff(8976, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff

	skill.AddSlowCheckDestBuff(8982, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	skill.AddSlowCheckDestBuff(8979, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(1, 555, 1);						-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444);

	----------------- 经验升级相关 ---------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(1, 1, 13863, 1)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 3;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离
	skill.nMaxRadius = 99 * LENGTH_BASE;					-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 99 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 25;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinChannelInterval = 1;-- 通道技间隔时间
	--skill.nChannelInterval = 0; 				-- 通道技间隔时间
	--skill.nChannelFrame = 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 射线技能相关 -------------------------------------------------
	skill.nTargetRayTargetType = 2; --射击目标为npc和player
	skill.nTargetRayWidth = 192; --射击宽度
	skill.nHeight = 480;

	----------------- 打断相关 -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSrcID)
	local npctarget = GetNpc(dwCharacterID)
	local npcboss = GetNpc(dwSrcID)
	local scene
	if npcboss then
		scene = npcboss.GetScene()
	end
	
	if scene.dwMapID == 221 then
		if npctarget and npctarget.dwTemplateID == 43275 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---完美配合成就
			end
			if not npctarget.GetBuff(8974, 1) then
				npctarget.AddBuff(0, 99, 8972, 1, 30)
				npctarget.AddBuff(0, 99, 8974, 1)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 43275 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 1)
			if not npctarget.GetBuff(8974, 1) then
				npctarget.AddBuff(0, 99, 8975, 1, 10)
				npctarget.AddBuff(0, 99, 8974, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 1)
			if not player.GetBuff(8974, 1) then
				player.AddBuff(0, 99, 8975, 1, 10)
				player.AddBuff(0, 99, 8974, 1)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 230 then
		if npctarget and npctarget.dwTemplateID == 47097 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---完美配合成就
			end
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8972, 2, 30)
				npctarget.AddBuff(0, 99, 8974, 2)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 47097 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 2)
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8975, 2, 10)
				npctarget.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 2)
			if not player.GetBuff(8974, 2) then
				player.AddBuff(0, 99, 8975, 2, 10)
				player.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 233 then
		if npctarget and npctarget.dwTemplateID == 47633 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---完美配合成就
			end
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8972, 2, 30)
				npctarget.AddBuff(0, 99, 8974, 2)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 47633 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 2)
			if not npctarget.GetBuff(8974, 2) then
				npctarget.AddBuff(0, 99, 8975, 2, 10)
				npctarget.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 or scene.dwMapID ~= 230 or scene.dwMapID ~= 233 then
						--npc.CastSkill(14296, 2, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 2)
			if not player.GetBuff(8974, 2) then
				player.AddBuff(0, 99, 8975, 2, 10)
				player.AddBuff(0, 99, 8974, 2)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 2, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 235 then
		if npctarget and npctarget.dwTemplateID == 48214 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---完美配合成就
			end
			if not npctarget.GetBuff(8974, 3) then
				npctarget.AddBuff(0, 99, 8972, 3, 30)
				npctarget.AddBuff(0, 99, 8974, 3)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 48214 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 3)
			if not npctarget.GetBuff(8974, 3) then
				npctarget.AddBuff(0, 99, 8975, 3, 10)
				npctarget.AddBuff(0, 99, 8974, 3)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 3)
			if not player.GetBuff(8974, 3) then
				player.AddBuff(0, 99, 8975, 3, 10)
				player.AddBuff(0, 99, 8974, 3)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end

	if scene.dwMapID == 237 then
		if npctarget and npctarget.dwTemplateID == 48680 then
			--local scene = npctarget.GetScene()
			local duoduo = scene.GetNpcByNickName("libaideduoduo")
			if duoduo then
				duoduo.SetCustomInteger1(2, 1)---完美配合成就
			end
			if not npctarget.GetBuff(8974, 4) then
				npctarget.AddBuff(0, 99, 8972, 4, 30)
				npctarget.AddBuff(0, 99, 8974, 4)
			end
		end
	
		if npctarget and npctarget.dwTemplateID ~= 48680 then
			npctarget.Die()
			--local scene = npctarget.GetScene()
			npctarget.AddBuff(0, 99, 8977, 4)
			if not npctarget.GetBuff(8974, 4) then
				npctarget.AddBuff(0, 99, 8975, 4, 10)
				npctarget.AddBuff(0, 99, 8974, 4)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.NPC, npctarget.dwID)
					end
				end
			end
		end
		
		local player = GetPlayer(dwCharacterID)
		if player then
			--local scene = player.GetScene()
			player.AddBuff(0, 99, 8977, 4)
			if not player.GetBuff(8974, 4) then
				player.AddBuff(0, 99, 8975, 4, 10)
				player.AddBuff(0, 99, 8974, 4)
				local npc = GetNpc(dwSrcID)
				if npc then
					if scene.dwMapID ~= 221 then
						--npc.CastSkill(14296, 1, TARGET.PLAYER, player.dwID)
					end
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com