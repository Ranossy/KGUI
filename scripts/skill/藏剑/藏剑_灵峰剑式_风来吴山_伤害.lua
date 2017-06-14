---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_风来吴山_伤害.lua
-- 更新时间:	2013/5/29 20:23:16
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_风来吴山.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-03-2
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  风来吴山
-- 技能效果  :  风来吴山，吴山来风，草木皆伏
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 108, 	nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 124, 	nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, 	nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 172, 	nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 188, 	nDamageRand = 7}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 204, 	nDamageRand = 8}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 220, 	nDamageRand = 9}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 236, 	nDamageRand = 9}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 252, 	nDamageRand = 10}, -- Level 10 
};           

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;



	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
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
		"skill/藏剑/藏剑_灵峰剑式_风来吴山_伤害.lua", -- 属性值1
		0														-- 属性值2
	);  
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 343);
	skill.AddCheckSelfLearntSkill(6543, 0, SKILL_COMPARE_FLAG.EQUAL);     --检查比较Caster自己已学习的技能ID和等级
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 80;
	elseif dwSkillLevel < 10 then
		skill.nChannelInterval =80 + (dwSkillLevel - 5) *15
	else
		skill.nChannelInterval = 160;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 160; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 80;	 			-- 通道技持续时间，单位帧数 
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 6 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 2048;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 10;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
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
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(6548) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6148, 1, 1)
		player.nCurrentRage = player.nCurrentRage + 5
	end

	if player.GetSkillLevel(6542) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9713, 1)
	end

	--藏剑风车附魔
	if player.GetSkillLevel(9292) == 1 then
		if player.GetBuff(10104, 6) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 7)
		elseif player.GetBuff(10104, 5) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 6)
		elseif player.GetBuff(10104, 4) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 5)
		elseif player.GetBuff(10104, 3) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 4)
		elseif player.GetBuff(10104, 2) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 3)
		elseif player.GetBuff(10104, 1) then
			player.AddBuff(player.dwID, player.nLevel, 10103, 2)
		else
			player.AddBuff(player.dwID, player.nLevel, 10103, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com