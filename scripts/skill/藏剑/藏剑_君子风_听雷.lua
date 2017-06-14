---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_君子风_听雷.lua
-- 更新时间:	2013/5/13 19:45:38
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_君子风_听雷.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-27
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  君子风
-- 技能名称  :  听雷
-- 技能效果  :  雷鸣不惊，沉稳大气。
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 28, 	nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 34, 	nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, 	nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 70, 	nDamageRand = 7}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 76, 	nDamageRand = 8}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 82, 	nDamageRand = 8}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 88, 	nDamageRand = 9},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, 	nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100, 	nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 106, 	nDamageRand = 11}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112, 	nDamageRand = 11}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 118, 	nDamageRand = 12}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 124, 	nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 130, 	nDamageRand = 13}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 136, 	nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 142, 	nDamageRand = 14}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 148, 	nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 154, 	nDamageRand = 16}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160, 	nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 166, 	nDamageRand = 17}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 172, 	nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 178, 	nDamageRand = 18}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 184, 	nDamageRand = 19}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190, 	nDamageRand = 19}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 196, 	nDamageRand = 20}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 202, 	nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 208, 	nDamageRand = 21}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 214, 	nDamageRand = 22}, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220, 	nDamageRand = 22}, -- Level 33 
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1706,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1707,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		1894, --属性值1
		2									--属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/藏剑/藏剑_君子风_听雷.lua",
		0
	);
--	skill.AddAttribute(									--重剑30级内功效果
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1785,
--		1
--	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 344);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = 16 + (dwSkillLevel - 8) * 5
	else
		skill.nChannelInterval = 144;     -- 通道技间隔时间   
	end
	
	--skill.nChannelInterval = 144;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
	if player.GetKungfuMount().dwSkillID == 10145 then
		if player.nCurrentRage <= 20 then
			return false
		else
			return nPreResult;
		end
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3836)
	end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetKungfuMount().dwSkillID == 10144 then
		if player.GetSkillLevel(5958) == 1 then
			player.CastSkill(6283, 1)
		else
			player.CastSkill(6282,1)
		end
	else
		if player.GetSkillLevel(5959) == 1 then
			player.CastSkill(6284, 1)
		else
			player.CastSkill(6281,1)
		end
	end

	--重剑下几率额外触发效果,这不能写在重剑下面，因为涉及到盾立反弹的问题
	if player.GetSkillLevel(5944) == 1 and player.GetKungfuMount() ~= nil and player.GetKungfuMount().dwSkillID == 10145 then
		local nChance = player.nCurrentRage * 0.005 * 10000
		local nRnd = Random(1, 10000)
		local nlevel = player.GetSkillLevel(1646)
		--print("nChance"..nChance)
		--print("nRnd"..nRnd)
		if nRnd <= nChance then
			player.CastSkill(14609,nlevel)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com