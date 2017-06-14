------------------------------------------------
-- 文件名    :  天策_子技能_龙吟_铁牢律.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-06-20
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  天策_子技能_龙吟_铁牢律
-- 技能名称  :  龙吟
-- 技能效果  :  铁牢律状态下,躲闪了目标攻击后,可以施放,对面前两个目标造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamage = 37*0.95, 	nDamageRand = 37*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 46*0.95, 	nDamageRand = 46*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 55*0.95, 	nDamageRand = 55*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 64*0.95, 	nDamageRand = 64*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 73*0.95, 	nDamageRand = 73*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 82*0.95, 	nDamageRand = 82*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 91*0.95, 	nDamageRand = 91*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 100*0.95, 	nDamageRand = 100*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 109*0.95, 	nDamageRand = 109*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 118*0.95, 	nDamageRand = 118*0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 127*0.95, 	nDamageRand = 127*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 136*0.95, 	nDamageRand = 136*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 145*0.95, 	nDamageRand = 145*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 154*0.95, 	nDamageRand = 154*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 163*0.95, 	nDamageRand = 163*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 172*0.95, 	nDamageRand = 172*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 181*0.95, 	nDamageRand = 181*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 190*0.95, 	nDamageRand = 190*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 199*0.95, 	nDamageRand = 199*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 208*0.95, 	nDamageRand = 208*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 217*0.95, 	nDamageRand = 217*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 226*0.95, 	nDamageRand = 226*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 235*0.95, 	nDamageRand = 235*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 244*0.95, 	nDamageRand = 244*0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 253*0.95, 	nDamageRand = 253*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 262*0.95, 	nDamageRand = 262*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 271*0.95, 	nDamageRand = 271*0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 280*0.95, 	nDamageRand = 280*0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.95, 	nDamageRand = 289*0.1, }, -- Level 29
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
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
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    skill.nAreaRadius		= 4 * LENGTH_BASE;		-- 技能作用半径
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
	skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
   	skill.nTargetCountLimit	= 1;								--最多作用1个目标	
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