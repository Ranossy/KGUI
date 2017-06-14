---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_平湖断月.lua
-- 更新时间:	2013/5/12 14:13:47
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_平湖断月.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  秀水剑法
-- 技能名称  :  玉虹贯日
-- 技能效果  :  平湖秋月，一剑划过水面，秋月变断月
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 15, nCostRage = 0, nDamageBase = 70, 		nDamageRand = 3}, -- Level 1 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 77, 		nDamageRand = 4}, -- Level 2 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 84, 		nDamageRand = 4}, -- Level 3 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 91, 		nDamageRand = 5}, -- Level 4 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 98, 		nDamageRand = 6}, -- Level 5 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 100, 		nDamageRand = 7}, -- Level 6 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 105, 		nDamageRand = 7}, -- Level 7 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 110, 		nDamageRand = 8}, -- Level 8 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 112, 		nDamageRand = 9}, -- Level 9 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 114, 		nDamageRand = 9}, -- Level 10 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 116, 		nDamageRand = 10},   	-- Level 11
	{nAddRage = 15, nCostRage = 0, nDamageBase = 118, 		nDamageRand = 11}, -- Level 12
	{nAddRage = 15, nCostRage = 0, nDamageBase = 120, 	nDamageRand = 11}, -- Level 13
	{nAddRage = 15, nCostRage = 0, nDamageBase = 122, 	nDamageRand = 12}, -- Level 14
	{nAddRage = 15, nCostRage = 0, nDamageBase = 124, 	nDamageRand = 13}, -- Level 15
	{nAddRage = 15, nCostRage = 0, nDamageBase = 125, 	nDamageRand = 14}, -- Level 16
	{nAddRage = 15, nCostRage = 0, nDamageBase = 132, 	nDamageRand = 14}, -- Level 17
	{nAddRage = 15, nCostRage = 0, nDamageBase = 139, 	nDamageRand = 15}, -- Level 18
	{nAddRage = 15, nCostRage = 0, nDamageBase = 146, 	nDamageRand = 16}, -- Level 19
	{nAddRage = 15, nCostRage = 0, nDamageBase = 153, 	nDamageRand = 16}, -- Level 20
	{nAddRage = 15, nCostRage = 0, nDamageBase = 160, 	nDamageRand = 17}, -- Level 21
	{nAddRage = 15, nCostRage = 0, nDamageBase = 167, 	nDamageRand = 18}, -- Level 22
	{nAddRage = 15, nCostRage = 0, nDamageBase = 174, 	nDamageRand = 18}, -- Level 23
	{nAddRage = 15, nCostRage = 0, nDamageBase = 181, 	nDamageRand = 19}, -- Level 24 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 188, 	nDamageRand = 20}, -- Level 25
	{nAddRage = 15, nCostRage = 0, nDamageBase = 195, 	nDamageRand = 21}, -- Level 26
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_TO_DST_BACK,
		60,
		0
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		13470,
		dwSkillLevel
	);
	--[[
	skill.AddAttribute(
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
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1687,
		2
	);--添加换动作用隐藏Buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/藏剑_秀水剑法_平湖断月.lua", -- 属性值1
		0														-- 属性值2
		);
	--附魔破甲效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/90级奇穴/平湖黄龙破甲效果.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 355);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 11 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 26 then
		skill.nChannelInterval = 16 + (dwSkillLevel -10) * 2
	else
		skill.nChannelInterval = 48;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 48;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
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
		player.AcquireAchievement(1359)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.AddBuff(dwCharacterID, player.nLevel, 5890, 1, 1)
	--[[
	if player.GetSkillLevel(5952) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5727, 1, 1)
	end
	--]]
end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com