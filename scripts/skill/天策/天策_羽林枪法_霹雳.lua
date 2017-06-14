---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_霹雳.lua
-- 更新时间:	2015/6/15 21:18:31
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_霹雳.lua
-- 创建人    :  张豪
-- 创建时间  :  2011-04-11
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  霹雳
-- 技能效果  :  强力的斩杀
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 214 * 0.95, nDamageRand = 214 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 232 * 0.95, nDamageRand = 232 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 250 * 0.95, nDamageRand = 250 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 268 * 0.95, nDamageRand = 268 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 286 * 0.95, nDamageRand = 286 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 304 * 0.95, nDamageRand = 304 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 322 * 0.95, nDamageRand = 322 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 340 * 0.95, nDamageRand = 340 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 358 * 0.95, nDamageRand = 358 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 376 * 0.95, nDamageRand = 376 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 394 * 0.95, nDamageRand = 394 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 412 * 0.95, nDamageRand = 412 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 430 * 0.95, nDamageRand = 430 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.SetSubsectionSkill(1, 1, 2917, 13);
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/天策/天策_羽林枪法_霹雳.lua",
		0
	);

	--skill.BindBuff(1, 2774, 1);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 437);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 440;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChainBranch = 3;					--链状技能分支数
	skill.nChainDepth = 1;					--链状技能层数

	skill.nWeaponDamagePercent = 2048;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nAreaRadius = 4 * LENGTH_BASE;		-- 技能作用半径
	--skill.nPrepareFrames    = 24;										--吟唱帧数,16帧等于1秒
	skill.nChannelInterval = 224;     -- 通道技间隔时间
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
	--skill.nBreakRate	= 1024;									--打断施法概率

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end


function Apply(dwCharacterID, dwSkillSrcID)
	--print(111)
	--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.IsSkillRecipeActive(1556,1) then
	   player.AddBuff(0,99,2774,1,15)
	else
	   player.AddBuff(0,99,2774,1,10)
	end
	--]]
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
	if player.IsSkillRecipeActive(1556,1) then
	   target.AddBuff(0,99,2774,1,12)
	else
	   target.AddBuff(0,99,2774,1,10)
	end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com