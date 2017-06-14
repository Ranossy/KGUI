---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/西河剑器_江海凝光.lua
-- 更新时间:	2013/5/31 1:06:01
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_西河剑器_江海凝光
-- 创建人    :  陈翰林
-- 创建时间  :  2008-08-25
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  外功
-- 武功套路  :  西河剑器
-- 技能名称  :  江海凝光
-- 技能效果  :  造成小量伤害，将一定比例的伤害转成内力转移给队友
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 40 * 0.95, nDamageRand = 40 * 0.1, nCostMana = 65, nDamToMana = 51}, --level 1
	{nDamage = 66 * 0.95, nDamageRand = 66 * 0.1, nCostMana = 65, nDamToMana = 51}, --level 1
	{nDamage = 85 * 0.95, nDamageRand = 85 * 0.1, nCostMana = 76, nDamToMana = 51}, --level 2
	{nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nCostMana = 91, nDamToMana = 51}, --level 3
	{nDamage = 121 * 0.95, nDamageRand = 121 * 0.1, nCostMana = 106, nDamToMana = 51}, --level 4
	{nDamage = 139 * 0.95, nDamageRand = 139 * 0.1, nCostMana = 121, nDamToMana = 51}, --level 5
	{nDamage = 154 * 0.95, nDamageRand = 154 * 0.1, nCostMana = 136, nDamToMana = 51}, --level 6
	{nDamage = 168 * 0.95, nDamageRand = 168 * 0.1, nCostMana = 151, nDamToMana = 51}, --level 7
	{nDamage = 181 * 0.95, nDamageRand = 181 * 0.1, nCostMana = 166, nDamToMana = 51}, --level 8
	{nDamage = 193 * 0.95, nDamageRand = 193 * 0.1, nCostMana = 181, nDamToMana = 51}, --level 9
	{nDamage = 204 * 0.95, nDamageRand = 204 * 0.1, nCostMana = 196, nDamToMana = 51}, --level 10
	{nDamage = 215 * 0.95, nDamageRand = 215 * 0.1, nCostMana = 196, nDamToMana = 51}, --level 12
};
tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}   
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
	--2920, -- 属性值1
	--0																-- 属性值2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/西河剑器_江海凝光.lua", -- 属性值1
		0															-- 属性值2
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
	--tSkillData[dwSkillLevel].nDamage * (1 - tPit[dwSkillLevel].nReducePercent),
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent),
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
	--0,
	--0
	--);
	
	--skill.nDamageToManaForParty = tSkillData[dwSkillLevel].nDamToMana; --伤害百分比转换成内力
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(409, 1, 2);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfBuff(693, 0, BUFF_COMPARE_FLAG.EQUAL)   --不需求剑神无我BUFF
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 683, 1);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 68);


	----------------- 经验升级相关 ---------------------------------------------
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
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 354*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 354 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 354 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 354 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 354;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--   skill.bIsAccumulate	= true;				-- 技能是否需要聚气
	--   skill.SetSubsectionSkill(1, 1, 211, dwSkillLevel);
	--   skill.SetSubsectionSkill(2, 2, 212, dwSkillLevel);
	--   skill.SetSubsectionSkill(3, 10, 213, dwSkillLevel);
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= tSkillData[dwSkillLevel].nLength * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  		= 0;				-- 吟唱帧数
	skill.nChannelInterval = 64; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 48;	 			-- 通道技持续时间，单位帧数 
	skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 1024;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
	if not player then
		return
	end
	local lv = player.GetSkillLevel(553)
	--江海凝光额外伤害
	--[[
	if player.GetSkillLevel(6558) == 1 then
		player.CastSkill(6560, lv)
	end
	--]]

	--有附魔标记buff，换技能吞噬不同层数的buff
	if player.GetSkillLevel(9345) == 1 then
		player.CastSkill(9427, lv)
	else
		player.CastSkill(6559, lv)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com