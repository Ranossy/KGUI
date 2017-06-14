---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_云飞玉皇.lua
-- 更新时间:	2013/7/24 14:26:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_云飞玉皇.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  云飞玉皇
-- 技能效果  :  玉皇上顶云层流动，雄伟壮丽
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 88, nDamageRand = 12}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 128, nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 20}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 208, nDamageRand = 24}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 248, nDamageRand = 28}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 288, nDamageRand = 32}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 328, nDamageRand = 36}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 368, nDamageRand = 40}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 408, nDamageRand = 44}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 448, nDamageRand = 48}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 488, nDamageRand = 52}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 528, nDamageRand = 56}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 568, nDamageRand = 60}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 608, nDamageRand = 64}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 648, nDamageRand = 68}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 688, nDamageRand = 72}, -- Level 16
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1595,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1594,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2900,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2899,
		dwSkillLevel
		);
	--删除自身无消耗buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		9849,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--2900,
	--dwSkillLevel
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----橙武效果，20110613郑海星
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----90橙武效果
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		2
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----95橙武效果
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1884,
		3
		);
	--使用后再次删除自身的瞬发buff
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, ----90橙武效果
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		2704,
		1
		);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 363);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostRage = 20;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 80;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 8 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 32;										--吟唱帧数,16帧等于1秒
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 2027, 1)
		return nPreResult 
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	--满级新手指引
	--满级新手指引任务
	--local nQuestIndex = player.GetQuestIndex(13422)
	--local nQuestPhase = player.GetQuestPhase(13422)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
end

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com