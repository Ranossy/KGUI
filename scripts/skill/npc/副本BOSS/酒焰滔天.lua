------------------------------------------------
-- 文件名    :  少林_韦陀献杵.lua
-- 创建人    :  刘欣	
-- 创建时间  :  9367-6-21
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  棍法
-- 技能名称  :  韦陀献杵
-- 技能效果  :  前方范围伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 1		0-4
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 2		5-9
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 3		10-14
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 4		15-19
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 5		20-24
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 6		25-29
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 7		30-34
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 8		35-39
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 9		40-44
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 10		45-49
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 11		50-54
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 12		55-59
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 13		60-64
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 14		65-69
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 15		70-74
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 16		75-79
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 17		80-84
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 18		85-89
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 19		90-94
	{nDamageBase = 936*0.8, nDamageRand = 936*0.4, nCostMana = 38,	nBuffID = 770,	nBuffLevel = 1},		--level 20		95-99	
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
        0, 
        0
    );

    
	skill.BindBuff(1,770,1);
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
   -- skill.SetPublicCoolDown(16);	--公共CD
	--  skill.SetNormalCoolDown(2, 65);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 5 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 85; 								--施放角度
    skill.nAreaRadius		= 5 * LENGTH_BASE;
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
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