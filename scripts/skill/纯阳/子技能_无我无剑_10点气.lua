---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/子技能_无我无剑_10点气.lua
-- 更新时间:	2013/11/26 11:18:39
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  子技能_吞日月_10点气.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2008-07-07
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  子技能
-- 技能名称  :  无
-- 技能效果  :  放气技能-无我无剑的子技能，根据气造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 254, nDamageRand = 15}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 328, nDamageRand = 24}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 402, nDamageRand = 32}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 476, nDamageRand = 40}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 550, nDamageRand = 48}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 624, nDamageRand = 56}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 698, nDamageRand = 65}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 772, nDamageRand = 73}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 846, nDamageRand = 81}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 920, nDamageRand = 89}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 994, nDamageRand = 97}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1068, nDamageRand = 106}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1142, nDamageRand = 114}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1216, nDamageRand = 122}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1290, nDamageRand = 130}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1364, nDamageRand = 138}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase  = 1438, nDamageRand = 147}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1512, nDamageRand = 155}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1586, nDamageRand = 163}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1660, nDamageRand = 171}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1734, nDamageRand = 179}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1808, nDamageRand = 188}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1882, nDamageRand = 196}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1956, nDamageRand = 204}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2030, nDamageRand = 212}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2104, nDamageRand = 220}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2178, nDamageRand = 229}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2252, nDamageRand = 237}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2326, nDamageRand = 245}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2400, nDamageRand = 253}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2474, nDamageRand = 261}, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2548, nDamageRand = 270}, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2622, nDamageRand = 278}, -- Level 34
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2696, nDamageRand = 286}, -- Level 35
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 10;
    
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/子技能_无我无剑_10点气.lua", -- 连协技
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/90级奇穴/立即回复5点气.lua", -- 连协技
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageBase * nSubsection / 10/12, -- 属性值1
		0															-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND, -- 魔法属性
		tSkillData[dwSkillLevel].nDamageRand * nSubsection / 10/12, -- 属性值1
		0															-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, -- 魔法属性
		0, -- 属性值1
		0													-- 属性值2
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		-5, -- 聚气3格
		0
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/七秀_七诀剑气.lua", -- 连协技
		0
	);	
    
	skill.AddAttribute(														--2010.05.08添加橙武技能
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1863,
		1
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetPublicCoolDown(16);						--公共CD 1.5秒
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= MELEE_ATTACK_DISTANCE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 4 * nSubsection*1.1*1.1;
	elseif dwSkillLevel < 35 then
		skill.nChannelInterval = (4 * nSubsection + (dwSkillLevel - 9) * 0.5 * nSubsection)*1.1*1.1; 
	else
		skill.nChannelInterval = 19 * nSubsection*1.1*1.1;     -- 通道技间隔时间 
	end
	--skill.nChannelFrame			= 0;	-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 2048;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	--player.CastSkill(711, 5)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local lv = player.GetSkillLevel(365)
	if player.GetSkillLevel(5800) == 1 and lv ~= 0 then
		target.AddBuff(player.dwID, player.nLevel, 5649, 1, 1)
		player.CastSkillXYZ(6085, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(480, target.nX, target.nY, target.nZ + 500)
	end
	---删除静笃对无我无剑的加成
	if player.GetBuff(11815, 1)then
		player.DelBuff(11815,1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com