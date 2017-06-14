---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_龙爪功_守缺式.lua
-- 更新时间:	2013/4/25 17:31:00
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  少林_龙爪功_守缺式.lua
-- 创建人    :  陈翰林	
-- 创建时间  :  2008-07-18	
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  龙爪功
-- 技能名称  :  守缺式
-- 技能效果  :  对单体目标造成较大的阳性内功伤害
--                   
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 65, 	nDamageRand = 7}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, 	nDamageRand = 8}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, 	nDamageRand = 8}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, 	nDamageRand = 9}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, 	nDamageRand = 9}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, 	nDamageRand = 9}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 89, 	nDamageRand = 10}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 93, 	nDamageRand = 10}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 97, 	nDamageRand = 11}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 101, 	nDamageRand = 11}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, 	nDamageRand = 11}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109, 	nDamageRand = 12}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 113, 	nDamageRand = 12}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 117, 	nDamageRand = 13}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 121, 	nDamageRand = 13}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, 	nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 129, 	nDamageRand = 14}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133, 	nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 137, 	nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 141, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, 	nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 149, 	nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153, 	nDamageRand = 16}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 157, 	nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 161, 	nDamageRand = 17}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 165, 	nDamageRand = 17}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 169, 	nDamageRand = 18}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 173, 	nDamageRand = 18}, -- Level 29

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--加1点反击值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
--非战斗状态多加1点反击值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		511,
		1
	);
    
	--施放 子技能_少林进攻阵法第五重
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		748,
		1
	);   
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 50);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 601 * 0.2;--技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 601 * 0.4;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 601 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 601 * 0.8;
	else
		skill.nCostManaBasePercent = 601;
	end
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 15; 				-- 通道技间隔时间
	if dwSkillLevel < 10 then
		skill.nChannelInterval =64;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = 64 + (dwSkillLevel - 8) * 4
	else
		skill.nChannelInterval = 154;     -- 通道技间隔时间   
	end
	
	--skill.nChannelInterval = 154;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
    
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	skill.nWeaponDamagePercent = 0;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
   
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com