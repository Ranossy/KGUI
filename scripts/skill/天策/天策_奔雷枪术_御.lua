---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_奔雷枪术_御.lua
-- 更新时间:	2013/6/5 19:58:34
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策-奔雷枪术-御.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-05-23 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  御
-- 技能效果  :  5秒化解2次伤害



------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 12, nBuffID = 360, nBuffLevel = 1},
	{nCostMana = 19, nBuffID = 360, nBuffLevel = 2},
	{nCostMana = 24, nBuffID = 360, nBuffLevel = 3},
	{nCostMana = 30, nBuffID = 360, nBuffLevel = 4},
	{nCostMana = 35, nBuffID = 360, nBuffLevel = 5},
	{nCostMana = 40, nBuffID = 360, nBuffLevel = 6},
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		360,
		tSkillData[dwSkillLevel].nBuffLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		614,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_奔雷枪术_御.lua", -- 属性值1
		0														-- 属性值2
	);
	--铁牢律额外加3层
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--		ATTRIBUTE_TYPE.CALL_BUFF,
--		360,
--		tSkillData[dwSkillLevel].nBuffLevel
--	);
	--2009年6月26日改为增加1层御 CBG

--施放 铁牢律的御_当关buff,需求铁牢律4级
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		614,
		dwSkillLevel
	);--]]
    
    
--	40级铁牢律添加 拆招 
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_BUFF,
--        tSkillData[dwSkillLevel].nBuffID,
--        tSkillData[dwSkillLevel].nBuffLevel
--    );
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 148);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 364;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验

	--skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度360°
	--skill.nAreaRadius		= 15 * LENGTH_BASE
    
    
	--skill.nPrepareFrames    = 32;										--吟唱帧数,16帧等于1秒
    
	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(442)
	if player.GetSkillLevel(6528) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		player.AddBuff(dwCharacterID, player.nLevel, 6334, 1, 1)
	end
	--[[
	if player.GetSkillLevel(5684) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6159, 1, 1)
	end
	--]]
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com