---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_灵峰剑式_夕照雷锋_正常.lua
-- 更新时间:	2013/4/26 9:44:02
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  藏剑_灵峰剑式_夕照雷锋.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2010-01-28
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  外功
-- 武功套路  :  灵峰剑式
-- 技能名称  :  夕照雷锋
-- 技能效果  :  夕阳斜照雷锋塔，利剑划过了无痕
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, 	nDamageRand = 8}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 320, 	nDamageRand = 10}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 360, 	nDamageRand = 13}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 370, 	nDamageRand = 16}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 380, 	nDamageRand = 19}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 390, 	nDamageRand = 22}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 400, 	nDamageRand = 24}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 410, 	nDamageRand = 27}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 420, 	nDamageRand = 30}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 430, 	nDamageRand = 33},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 440, 	nDamageRand = 36}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, 	nDamageRand = 38}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 460, 	nDamageRand = 41}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 465, 	nDamageRand = 44}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 470, 	nDamageRand = 47}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 493, 	nDamageRand = 50}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 521, 	nDamageRand = 52}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 549, 	nDamageRand = 55}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 577, 	nDamageRand = 58}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 605, 	nDamageRand = 61}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 633, 	nDamageRand = 64}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 661, 	nDamageRand = 66}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 689, 	nDamageRand = 69}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 717, 	nDamageRand = 72}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 745, 	nDamageRand = 75}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 773, 	nDamageRand = 78}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 801, 	nDamageRand = 80}, -- Level 28   
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*0.25,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*0.25,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/藏剑_灵峰剑式_夕照雷锋_正常.lua", -- 属性值1
		0														-- 属性值2
	);
	
	skill.AddSlowCheckSelfBuff(2682, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 335);
	

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 72;
	skill.nMinRadius = 0 * LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 10 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nWeaponDamagePercent = 2048;
	--skill.nPrepareFrames    = 24;
	--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 84;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = 84 + (dwSkillLevel - 9) * 5
	else
		skill.nChannelInterval = 180;     -- 通道技间隔时间   
	end
	--skill.nChannelInterval = 180;
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
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	local i = Random(1, 10)
	if i <= 3 then
		if player.GetSkillLevel(5956) == 1 then
			player.nCurrentRage = player.nCurrentRage + 10
		end
	end
	--]]
	local lv = player.GetSkillLevel(1600)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--[[
	if player.GetSkillLevel(5957) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5729, 1, 1)
		if player.GetBuff(5729, 1).nStackNum == 3 then
			target.AddBuff(dwCharacterID, player.nLevel, 5730, 1, 1)
			player.CastSkill(6168, lv)
			player.DelBuff(5729, 1)
			player.DelBuff(5729, 1)
			player.DelBuff(5729, 1)
		end
	end
	--]]
end
--
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com