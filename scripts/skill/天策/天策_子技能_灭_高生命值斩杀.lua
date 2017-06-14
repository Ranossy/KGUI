------------------------------------------------
-- 文件名    :  天策_子技能_灭_高生命值.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-08-21
-- 修改时间  ： 2008-08-21
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  灭_高生命值
-- 技能效果  :  自身血量大于等于50%之后,造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 139, nDamage = 125*0.95, 	nDamageRand = 125*0.1,  nDebuffLevel = 1},		-- Level 1
	{nCostLife = 161, nDamage = 132*0.95, 	nDamageRand = 132*0.1,  nDebuffLevel = 1},		-- Level 2
	{nCostLife = 183, nDamage = 138*0.95, 	nDamageRand = 138*0.1,  nDebuffLevel = 1},		-- Level 3
	{nCostLife = 205, nDamage = 145*0.95, 	nDamageRand = 145*0.1,  nDebuffLevel = 1},		-- Level 4 
	{nCostLife = 227, nDamage = 151*0.95, 	nDamageRand = 151*0.1,  nDebuffLevel = 1},		-- Level 5
	{nCostLife = 242, nDamage = 158*0.95, 	nDamageRand = 158*0.1,  nDebuffLevel = 1},		-- Level 6
	{nCostLife = 139, nDamage = 164*0.95, 	nDamageRand = 164*0.1,  nDebuffLevel = 1},		-- Level 7
	{nCostLife = 161, nDamage = 171*0.95, 	nDamageRand = 171*0.1,  nDebuffLevel = 1},		-- Level 8
	{nCostLife = 183, nDamage = 177*0.95, 	nDamageRand = 177*0.1,  nDebuffLevel = 1},		-- Level 9
	{nCostLife = 205, nDamage = 184*0.95, 	nDamageRand = 184*0.1,  nDebuffLevel = 1},		-- Level 10 
	{nCostLife = 227, nDamage = 190*0.95, 	nDamageRand = 190*0.1,  nDebuffLevel = 1},		-- Level 11
	{nCostLife = 242, nDamage = 197*0.95, 	nDamageRand = 197*0.1,  nDebuffLevel = 1},		-- Level 12
	{nCostLife = 139, nDamage = 203*0.95, 	nDamageRand = 203*0.1,  nDebuffLevel = 1},		-- Level 13
	{nCostLife = 161, nDamage = 210*0.95, 	nDamageRand = 210*0.1,  nDebuffLevel = 1},		-- Level 14
	{nCostLife = 183, nDamage = 216*0.95, 	nDamageRand = 216*0.1,  nDebuffLevel = 1},		-- Level 15
	{nCostLife = 205, nDamage = 223*0.95, 	nDamageRand = 223*0.1,  nDebuffLevel = 1},		-- Level 16 
	{nCostLife = 227, nDamage = 229*0.95, 	nDamageRand = 229*0.1,  nDebuffLevel = 1},		-- Level 17
	{nCostLife = 242, nDamage = 236*0.95, 	nDamageRand = 236*0.1,  nDebuffLevel = 1},		-- Level 18
	{nCostLife = 139, nDamage = 242*0.95, 	nDamageRand = 242*0.1,  nDebuffLevel = 1},		-- Level 19
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/4, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/4, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);


    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 609);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;
	----------------- 设置技能施放buff需求 ----------------------------------------------------------------------

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    ----------------- 自身血量需求 ---------------------------------------------
	skill.nSelfLifePercentMin	= 51;			-- 血量最小值>=
	skill.nSelfLifePercentMax	= 100;			-- 血量最大值<=
	
	skill.nWeaponDamagePercent	= 1024/4;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    if dwSkillLevel < 10 then
  		skill.nChannelInterval = 70*0.4;
 	elseif dwSkillLevel < 19 then
  		skill.nChannelInterval =(70 + (dwSkillLevel - 9) * 10)*0.4
  	else
  		skill.nChannelInterval =170*0.4;     -- 通道技间隔时间   
 	end   
	--skill.nPrepareFrames    = 170;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com