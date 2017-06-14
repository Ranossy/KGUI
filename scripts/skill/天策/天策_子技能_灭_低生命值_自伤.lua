------------------------------------------------
-- 文件名    :  天策_子技能_灭_低生命值_自伤.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-08-21
-- 修改时间  ： 2008-08-21
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  灭_低生命值
-- 技能效果  :  自身血量少于50%之后,灭的伤害加倍,消耗减少50%,对自己造成外功伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 125*0.5,  nDamage = 125*2*0.95, 	nDamageRand = 125*2*0.1,  nDebuffLevel = 1},		-- Level 1
	{nCostLife = 132*0.5,  nDamage = 132*2*0.95, 	nDamageRand = 132*2*0.1,  nDebuffLevel = 1},		-- Level 2
	{nCostLife = 138*0.5,  nDamage = 138*2*0.95, 	nDamageRand = 138*2*0.1,  nDebuffLevel = 1},		-- Level 3
	{nCostLife = 145*0.5,  nDamage = 145*2*0.95, 	nDamageRand = 145*2*0.1,  nDebuffLevel = 1},		-- Level 4 
	{nCostLife = 151*0.5,  nDamage = 151*2*0.95, 	nDamageRand = 151*2*0.1,  nDebuffLevel = 1},		-- Level 5
	{nCostLife = 158*0.5,  nDamage = 158*2*0.95, 	nDamageRand = 158*2*0.1,  nDebuffLevel = 1},		-- Level 6
	{nCostLife = 164*0.5,  nDamage = 164*2*0.95, 	nDamageRand = 164*2*0.1,  nDebuffLevel = 1},		-- Level 7
	{nCostLife = 171*0.5,  nDamage = 171*2*0.95, 	nDamageRand = 171*2*0.1,  nDebuffLevel = 1},		-- Level 8
	{nCostLife = 177*0.5,  nDamage = 177*2*0.95, 	nDamageRand = 177*2*0.1,  nDebuffLevel = 1},		-- Level 9
	{nCostLife = 184*0.5,  nDamage = 184*2*0.95, 	nDamageRand = 184*2*0.1,  nDebuffLevel = 1},		-- Level 10 
	{nCostLife = 190*0.5,  nDamage = 190*2*0.95, 	nDamageRand = 190*2*0.1,  nDebuffLevel = 1},		-- Level 11
	{nCostLife = 197*0.5,  nDamage = 197*2*0.95, 	nDamageRand = 197*2*0.1,  nDebuffLevel = 1},		-- Level 12
	{nCostLife = 203*0.5,  nDamage = 203*2*0.95, 	nDamageRand = 203*2*0.1,  nDebuffLevel = 1},		-- Level 13
	{nCostLife = 210*0.5,  nDamage = 210*2*0.95, 	nDamageRand = 210*2*0.1,  nDebuffLevel = 1},		-- Level 14
	{nCostLife = 216*0.5,  nDamage = 216*2*0.95, 	nDamageRand = 216*2*0.1,  nDebuffLevel = 1},		-- Level 15
	{nCostLife = 223*0.5,  nDamage = 223*2*0.95, 	nDamageRand = 223*2*0.1,  nDebuffLevel = 1},		-- Level 16 
	{nCostLife = 229*0.5,  nDamage = 229*2*0.95, 	nDamageRand = 229*2*0.1,  nDebuffLevel = 1},		-- Level 17
	{nCostLife = 236*0.5,  nDamage = 236*2*0.95, 	nDamageRand = 236*2*0.1,  nDebuffLevel = 1},		-- Level 18
	{nCostLife = 242*0.5,  nDamage = 242*2*0.95, 	nDamageRand = 242*2*0.1,  nDebuffLevel = 1},		-- Level 19
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
--		-1024, 
--		0
--	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nCostLife/3, 
		0
	);
--
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--		tSkillData[dwSkillLevel].nDamageRand, 
--		0
--	);
--    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);

	skill.AddSlowCheckSelfBuff(2854, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 434);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;
	----------------- 设置技能施放buff需求 ----------------------------------------------------------------------

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    ----------------- 自身血量需求 ---------------------------------------------
	skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
	skill.nSelfLifePercentMax	= 50;			-- 血量最大值<=
	
	skill.nWeaponDamagePercent	= 0;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
	skill.nChannelInterval	= 16; 									-- 通道技间隔时间 
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
	return true;
end


--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
----判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com