---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/安雨_圣火焚城.lua
-- 更新时间:	2015/3/20 16:26:17
-- 更新用户:	guozhaoxing1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 19600, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 19600 + 9800, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 19600 + 9800 * 2, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 19600 + 9800 * 3, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 19600 + 9800 * 4, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 19600 + 9800 * 5, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 19600 + 9800 * 6 + 49000, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 23000, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 23000 + 11500, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 23000 + 11500 * 2, nDamageRand = 0, nCostMana = 0}, --level 10
	{nDamageBase = 23000 + 11500 * 3, nDamageRand = 0, nCostMana = 0}, --level 11
	{nDamageBase = 23000 + 11500 * 4, nDamageRand = 0, nCostMana = 0}, --level 12
	{nDamageBase = 23000 + 11500 * 5, nDamageRand = 0, nCostMana = 0}, --level 13
	{nDamageBase = 23000 + 11500 * 6 + 69000, nDamageRand = 0, nCostMana = 0}, --level 14
	{nDamageBase = 32800, nDamageRand = 0, nCostMana = 0}, --level 15
	{nDamageBase = 32800 + 19700, nDamageRand = 0, nCostMana = 0}, --level 16
	{nDamageBase = 32800 + 19700 * 2, nDamageRand = 0, nCostMana = 0}, --level 17
	{nDamageBase = 32800 + 19700 * 3, nDamageRand = 0, nCostMana = 0}, --level 18
	{nDamageBase = 32800 + 19700 * 4, nDamageRand = 0, nCostMana = 0}, --level 19
	{nDamageBase = 32800 + 19700 * 5, nDamageRand = 0, nCostMana = 0}, --level 20
	{nDamageBase = 32800 + 19700 * 6 + 98500, nDamageRand = 0, nCostMana = 0}, --level 21
	{nDamageBase = 20700, nDamageRand = 0, nCostMana = 0}, --level 22
	{nDamageBase = 20700 + 10300, nDamageRand = 0, nCostMana = 0}, --level 23
	{nDamageBase = 20700 + 10300 * 2, nDamageRand = 0, nCostMana = 0}, --level 24
	{nDamageBase = 20700 + 10300 * 3, nDamageRand = 0, nCostMana = 0}, --level 25
	{nDamageBase = 20700 + 10300 * 4, nDamageRand = 0, nCostMana = 0}, --level 26
	{nDamageBase = 20700 + 10300 * 5, nDamageRand = 0, nCostMana = 0}, --level 27
	{nDamageBase = 20700 + 10300 * 6 + 51500, nDamageRand = 0, nCostMana = 0}, --level 28
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	if dwSkillLevel == 7 or dwSkillLevel == 14 or dwSkillLevel == 21 or dwSkillLevel == 28 then
		for i = 1, 6 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
				360,
				i
			);
		end

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			856,
			1
		);

		for i = 1, 6 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
				203,
				i
			);
		end

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK,
			ATTRIBUTE_TYPE.GLOBAL_BLOCK,
			-2,
			0
		);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK,
			ATTRIBUTE_TYPE.GLOBAL_RESIST_PERCENT,
			-1024,
			0
		);
	end

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/npc/副本BOSS/太原之战_逐虎驱狼/安雨_圣火焚城.lua", -- 属性值1
		0														-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14 ,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14 ,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
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
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

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

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 100 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 30;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 2 * GLOBAL.GAME_FPS;				-- 吟唱帧数

	skill.nBeatBackRate = 0 * PERCENT_BASE;
	skill.nBrokenRate = 0 * PERCENT_BASE;
	skill.nBreakRate = 0 * PERCENT_BASE;

	skill.nWeaponDamagePercent = 0;

	return true;
end

function CanCast(player, nPreResult)
	return nPreResult;
end

function OnSkillLevelUp(skill, player)

end

function OnSkillForgotten(skill, player)

end

function Apply(dwCharacterID, dwSkillSrcID)
	local playerA = GetPlayer(dwCharacterID)
	if playerA then
		playerA.PlaySfx(1070, playerA.nX, playerA.nY, playerA.nZ + 500)
	end
end

function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com