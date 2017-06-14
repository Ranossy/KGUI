---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_游龙骑法_断魂刺.lua
-- 更新时间:	2013/5/28 21:16:13
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_游龙骑法_断魂刺.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-06
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法
-- 技能名称  :  断魂刺.
-- 技能效果  :  解除一切移动限制,快速冲向敌人,对其造成伤害并将其击晕,
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

-- 共8级
tSkillData = 
{
	{nCostMana = 35, nDashSpeed = 100}, -- Level 1 nDashSpeed 冲锋速度单位 点/帧
	{nCostMana = 53, nDashSpeed = 100}, -- Level 2
	{nCostMana = 78, nDashSpeed = 100}, -- Level 3
	{nCostMana = 98, nDashSpeed = 100}, -- Level 4
	{nCostMana = 117, nDashSpeed = 100}, -- Level 5
	{nCostMana = 137, nDashSpeed = 100}, -- Level 6
	{nCostMana = 157, nDashSpeed = 100}, -- Level 7

};              


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
--添加执行脚本,DelMultiGroupBuffByFunctionType驱散各类移动限制
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/天策/天策_游龙骑法_断魂刺.lua",
		0
	);

	--2009-6-26  去掉 冲破移动限制 (CBG)
--增加entrap
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		541,
		1
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
--子技能 子弹伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		409,
		dwSkillLevel
	);
	

	

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		-- 公共CD1秒
	skill.SetNormalCoolDown(1, 105);		-- CD20秒
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 167;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 8 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
    
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

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(6511) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6122, 1, 1)
	end
	--]]
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com