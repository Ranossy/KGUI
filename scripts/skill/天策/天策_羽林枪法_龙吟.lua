---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_龙吟.lua
-- 更新时间:	2013/5/28 23:32:02
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_龙吟.lua
-- 创建人    :  张奇
-- 修改时间  ： 2008-06-04 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  龙吟
-- 技能效果  :  使用天策伤害技能时10%触发克敌效果,使用后能施放龙吟,龙吟有50%几率附带重伤效果.
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 39, 	nDamageRand = 5, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 50, 	nDamageRand = 5, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 55, 	nDamageRand = 5, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 65, 	nDamageRand = 5, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 70, 	nDamageRand = 5, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 72, 	nDamageRand = 5, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 73, 	nDamageRand = 5, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 75, 	nDamageRand = 5, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 77, 	nDamageRand = 5, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 80, 	nDamageRand = 5, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 85, 	nDamageRand = 10, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 90, 	nDamageRand = 10, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 95, 	nDamageRand = 10, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 100, 	nDamageRand = 10, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 105, 	nDamageRand = 10, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 110, 	nDamageRand = 10, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 115, 	nDamageRand = 10, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 190*0.65, 	nDamageRand = 10, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 199*0.65, 	nDamageRand = 10, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 208*0.65, 	nDamageRand = 15, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 217*0.65, 	nDamageRand = 15, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 226*0.65, 	nDamageRand = 15, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 235*0.65, 	nDamageRand = 15, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 244*0.65, 	nDamageRand = 15, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 253*0.65, 	nDamageRand = 15, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 262*0.65, 	nDamageRand = 15, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 271*0.65, 	nDamageRand = 15, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 280*0.65, 	nDamageRand = 15, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.65, 	nDamageRand = 15, }, -- Level 29
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		429,
--		dwSkillLevel
--	);
--	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		430,
--		dwSkillLevel
--	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
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
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_羽林枪法_龙吟.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 150);
	--skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	-- skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 167*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 167 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 167 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 167 * 0.8;
	else
		skill.nCostManaBasePercent = 167;
	end
	----------------- 设置技能施放buff需求 ----------------------------------------------------------------------
	--skill.AddSlowCheckDestBuff(10226, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddSlowCheckSelfBuff(366, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    	
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 70;
 	elseif dwSkillLevel < 29 then
  		skill.nChannelInterval =70 + (dwSkillLevel - 9) * 5
  	else
  		skill.nChannelInterval =184;     -- 通道技间隔时间   
 	end
	
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(36)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end

	--龙吟使目标减速效果
	if player.GetSkillLevel(5662) == 1 or player.GetSkillLevel(5681) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6130, 1, 1)
	end

	--风虎后下3次攻击伤害提高20%
	if player.GetSkillLevel(5666) == 1 then
		--添加前先删除之前的标记计数buff
		if player.GetBuff(8837,1) then
			player.DelGroupBuff(8837, 1)
		end
		player.AddBuff(player.dwID, player.nLevel, 8835, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com