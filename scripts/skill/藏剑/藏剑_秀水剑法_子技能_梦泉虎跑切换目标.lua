---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_子技能_梦泉虎跑切换目标.lua
-- 更新时间:	2013/5/29 20:45:15
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_秀水剑法_子技能_梦泉虎跑切换目标.lua
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
	{nAddRage = 10, nCostRage = 0, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nDashSpeed = 100}, -- Level 1 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nDashSpeed = 100}, -- Level 2 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nDashSpeed = 100}, -- Level 3 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nDashSpeed = 100}, -- Level 4 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nDashSpeed = 100}, -- Level 5 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nDashSpeed = 100}, -- Level 6 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nDashSpeed = 100}, -- Level 7 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nDashSpeed = 100}, -- Level 8 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nDashSpeed = 100}, -- Level 9 Dash速度单位 点/帧
	{nAddRage = 10, nCostRage = 0, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nDashSpeed = 100}, -- Level 10 Dash速度单位 点/帧
	
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.AUTO_SELECT_TARGET,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_秀水剑法_子技能_梦泉虎跑切换目标.lua",
		0
	);
  
	--skill.AddSlowCheckSelfBuff(1739, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckDestBuff(1738, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddCheckSelfLearntSkill(2748, 1, 2);     --检查比较Caster自己已学习的技能ID和等级
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 32;
	skill.nAreaRadius = 15 * LENGTH_BASE;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 15 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 0;
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
	if not player.GetTarget() then
		return nPreResult;
	end
	local target
	local targetType, targetID = player.GetTarget()
	if GetNpc(targetID) then
		target = GetNpc(targetID)
	elseif GetPlayer(targetID) then
		target = GetPlayer(targetID)
	end
	for i = 1, 6 do
		if player.GetBuff(1739, i) and player.GetSkillLevel(2748) then
			return false
		elseif target and target.GetBuff(1738, i) and player.GetSkillLevel(2748) then
			return false
		end
	end
    
	return nPreResult;
    
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local target = player.GetSelectCharacter()
	if target == nil then
		return false
	end
	local nDirection = GetLogicDirection(target.nX - player.nX, target.nY - player.nY);
	player.TurnTo(nDirection)
	
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com