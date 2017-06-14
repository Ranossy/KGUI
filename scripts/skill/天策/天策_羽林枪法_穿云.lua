---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_穿云.lua
-- 更新时间:	2013/5/28 19:40:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_穿云.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-02-26 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  穿云
-- 技能效果  :  瞬间刺出多枪，随着等级提升，次数变化。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 35, 	nDamageRand = 5, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 42, 	nDamageRand = 5, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 45, 	nDamageRand = 5, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 50, 	nDamageRand = 5, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 52, 	nDamageRand = 5, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 55, 	nDamageRand = 5, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 56, 	nDamageRand = 5, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 58, 	nDamageRand = 5, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 60, 	nDamageRand = 5, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 62, 	nDamageRand = 5, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 64, 	nDamageRand = 5, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 68, 	nDamageRand = 10, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 72, 	nDamageRand = 10, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 76, 	nDamageRand = 10, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 80, 	nDamageRand = 10, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 84, 	nDamageRand = 10, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 88, 	nDamageRand = 10, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 92, 	nDamageRand = 10, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 96, 	nDamageRand = 10, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 100, 	nDamageRand = 15, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 104, 	nDamageRand = 15, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 109, 	nDamageRand = 15, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 115, 	nDamageRand = 15, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 120, 	nDamageRand = 15, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 130, 	nDamageRand = 15, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 140, 	nDamageRand = 15, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 150, 	nDamageRand = 15, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 160, 	nDamageRand = 15, }, -- Level 28
};
    
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		406,
		1
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		438,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_羽林枪法_穿云.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 91);
	skill.SetCheckCoolDown(1, 444)
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 167 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 167 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 167 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 167 * 0.8;
	else
		skill.nCostManaBasePercent = 167;
	end
   
	----------------- 设置杂项参数 ----------------------------------------------------------------------
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 36;
 	elseif dwSkillLevel < 28 then
  		skill.nChannelInterval = 36 + (dwSkillLevel - 9) * 5
  	else
  		skill.nChannelInterval = 158;     -- 通道技间隔时间   
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
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13251)
	local nQuestPhase = player.GetQuestPhase(13251)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local i = Random(1, 100)
	if i <= 35 then
		if player.GetSkillLevel(5659) == 1 then
			player.CastSkill(406, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com