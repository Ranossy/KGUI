---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_三才化生.lua
-- 更新时间:	2013/4/19 10:38:59
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  北冥剑气_三才化生.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  北冥剑气
-- 技能名称  :  三才化生
-- 技能效果  :  施法者周围AOE
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, 	nDamageRand = 8}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160, 	nDamageRand = 12}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 180, 	nDamageRand = 15}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 185, 	nDamageRand = 19}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220, 	nDamageRand = 22}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255, 	nDamageRand = 26}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 290, 	nDamageRand = 29}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 325, 	nDamageRand = 33}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 360, 	nDamageRand = 36}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 395, 	nDamageRand = 40}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 430, 	nDamageRand = 43}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 465, 	nDamageRand = 47}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 500, 	nDamageRand = 50}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 535, 	nDamageRand = 54}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 570, 	nDamageRand = 57}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 605, 	nDamageRand = 61}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 640, 	nDamageRand = 64}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 675, 	nDamageRand = 68}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 710, 	nDamageRand = 71}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 745, 	nDamageRand = 75}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 780, 	nDamageRand = 78}, -- Level 22
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	--skill.bIsAccumulate = true;
	--skill.SetSubsectionSkill(1, 1, 327, dwSkillLevel);   --第一段
	--skill.SetSubsectionSkill(2, 2, 328, dwSkillLevel);		--第二段
	--skill.SetSubsectionSkill(3, 3, 329, dwSkillLevel);		--第三段
	--skill.SetSubsectionSkill(4, 4, 330, dwSkillLevel);   --第一段
	--skill.SetSubsectionSkill(5, 5, 331, dwSkillLevel);		--第二段
	--skill.SetSubsectionSkill(6, 6, 461, dwSkillLevel);		--第三段
	--skill.SetSubsectionSkill(7, 7, 462, dwSkillLevel);   	--第一段
	--skill.SetSubsectionSkill(8, 8, 463, dwSkillLevel);		--第二段
	--skill.SetSubsectionSkill(9, 9, 464, dwSkillLevel);		--第三段
	--skill.SetSubsectionSkill(10, 10, 465, dwSkillLevel);	--第三段
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/北冥剑气_三才化生.lua", -- 连协技
		0
	);	 	 
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- 混元伤害
		tSkillData[dwSkillLevel].nDamageBase*0.1, -- 属性值1
		0																-- 属性值2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- 混元伤害浮动值
		tSkillData[dwSkillLevel].nDamageRand*0.1, -- 属性值1
		0																-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- Call混元伤害
		0, -- 属性值1
		0																-- 属性值2
	);	
	
	
	skill.BindBuff(1, 1937, 5);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 182);	--12秒
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 4 then
		skill.nCostManaBasePercent = 272*0.1;	-- 技能消耗的内力
	elseif dwSkillLevel <= 8 then
		skill.nCostManaBasePercent = 272*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 272*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 272*0.7;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 272;	-- 技能消耗的内力
	end
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0									--技能施放最小半径
	skill.nMaxRadius = 0;								--技能施放最大半径
	skill.nAngleRange = 256; 								--施放角度
	skill.nAreaRadius = 8 * LENGTH_BASE;					--技能作用半径
	skill.nTargetCountLimit = 6;
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBrokenRate = 1024;									--被打断的概率,默认1024表示一定被打断
    
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
	--local lv = player.GetSkillLevel(301)
	if player.GetSkillLevel(5835) == 1 then
		player.CastSkill(336, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com