---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_太极无极_非锁足定身.lua
-- 更新时间:	2013/5/11 16:15:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  北冥剑气_太极无极.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  北冥剑气
-- 技能名称  :  太极无极
-- 技能效果  :  单体伤害技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, nDamageRand = 2}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 84, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 98, nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 112, nDamageRand = 6}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 126, nDamageRand = 8}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 9}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 154, nDamageRand = 11}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 12}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 182, nDamageRand = 13}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 196, nDamageRand = 15}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 210, nDamageRand = 16}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 224, nDamageRand = 18}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 238, nDamageRand = 19}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 252, nDamageRand = 20}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 266, nDamageRand = 22}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 280, nDamageRand = 23}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 294, nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 308, nDamageRand = 26}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 322, nDamageRand = 27}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 336, nDamageRand = 29}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 350, nDamageRand = 30}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 364, nDamageRand = 32}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 378, nDamageRand = 33}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 392, nDamageRand = 34}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 406, nDamageRand = 36}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, nDamageRand = 37}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 434, nDamageRand = 39}, -- Level 27 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 448, nDamageRand = 40}, -- Level 28 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 462, nDamageRand = 41}, -- Level 29 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 476, nDamageRand = 43}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 490, nDamageRand = 44}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 504, nDamageRand = 46}, -- Level 32
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,
		3000,
		0
	);
   	--]]	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/7,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/7,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0,
		0
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CALL_BUFF,
		2337, -- 2格
		1																-- 
	);
   		   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(6424, 3, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);	
	--skill.AddSlowCheckSelfBuff(2337, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	-- 公共CD
	--skill.SetNormalCoolDown(1, 461);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 30 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 8*0.8;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (8 + (dwSkillLevel - 9) * 2)*0.8
	else
		skill.nChannelInterval = 100*0.8;     -- 通道技间隔时间   
	end
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
       
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com