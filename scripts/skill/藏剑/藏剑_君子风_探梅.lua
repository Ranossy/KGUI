---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_君子风_探梅.lua
-- 更新时间:	2013/5/8 18:49:30
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_君子风_探梅.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  君子风
-- 技能名称  :  探梅
-- 技能效果  :  孤山西溪探梅，梅香怡神。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDashSpeed = 100}, -- Level 10
	
};           
             
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
		"skill/藏剑/藏剑_君子风_探梅.lua",				-- 属性值1
		0														-- 属性值2
	);--]]
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1759,
		1
	);  --探梅换动作隐藏Buff
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_TO_DST_BACK,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	
	skill.AddAttribute(								--解除对方控制
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1657,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/藏剑_君子风_探梅.lua", -- 属性值1
		0														-- 属性值2
	);
--	skill.AddAttribute(								--快剑50级内功探梅加跑速
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1779,
--		1
--	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 346);
	--skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 15 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult, SkillTarget)    --判断玩家的状态，以判断是否可以发出技能
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult 
	end
	local target = SkillTarget.GetPlayer()
	local state = target.GetOTActionState()
	if state == 1 or state == 2 then
		player.SendSystemMessage(GetEditorString(3, 9047))
		return false;
	else
		return SKILL_RESULT_CODE.SUCCESS
	end
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	if player.GetSkillLevel(5950) == 1 then
		if not target.GetBuff(5726, 1) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 5725, 1, 1)
			target.AddBuff(dwSkillSrcID, player.nLevel, 5726, 1, 1)
			player.AddBuff(dwSkillSrcID, player.nLevel, 5725, 1, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end 
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com