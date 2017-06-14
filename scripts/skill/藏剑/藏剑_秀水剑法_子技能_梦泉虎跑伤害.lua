---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_子技能_梦泉虎跑伤害.lua
-- 更新时间:	2013/5/7 11:36:17
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_子技能_梦泉虎跑伤害.lua
-- 创建人    :  
-- 创建时间  :  
-- 用途(模块):  
-- 武功门派  :  
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 8, 	nDamageRand = 1}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 9, 	nDamageRand = 1}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 10, 	nDamageRand = 1}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 11, 	nDamageRand = 1}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 12, 	nDamageRand = 1}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 13, 	nDamageRand = 1}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 14, 	nDamageRand = 2}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 15, 	nDamageRand = 2}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 16, 	nDamageRand = 2}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 17, 	nDamageRand = 2}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 18, 	nDamageRand = 2},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 19, 	nDamageRand = 2}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, 	nDamageRand = 2}, -- Level 13
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--副本组的冲刺技能标记buff需求
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7795,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*3,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*3,
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
		"skill/藏剑/藏剑_秀水剑法_子技能_梦泉虎跑伤害.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--    skill.SetPublicCoolDown(16);		--公共CD1秒

	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 32*0.85;
	elseif dwSkillLevel < 13 then
		skill.nChannelInterval =(32 + (dwSkillLevel - 5) *3)*0.85
	else
		skill.nChannelInterval = 64*0.85;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 64;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 12 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	--skill.nDismountingRate  = 1024;									--落马率为100%
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
    
	--skill.nStiffFrame		= 16; 
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	target.AddBuff(dwSkillSrcID, player.nLevel, 5723, 1, 1)
	local lv = player.GetSkillLevel(1589)
	if player.GetSkillLevel(5943) == 1 then
		player.CastSkill(6164, lv)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com