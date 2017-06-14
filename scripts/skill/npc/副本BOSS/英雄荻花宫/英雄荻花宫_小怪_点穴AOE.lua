------------------------------------------------
-- 文件名    : 荻花宫_小怪_点穴AOE.lua
-- 创建人    : CBG
-- 创建时间  :  2009-11-26
-- 用途(模块):  副本小怪
-- 武功门派  :  荻花宫
-- 武功类型  : 
-- 武功套路  :  
-- 技能名称  :  Dahlia
-- 技能效果  :  大丽花是一种大丽花属植物，长有块茎状的根和各种颜色的艳丽射线状花头。
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 130 * 0.8, nDamageRand = 130 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 178 * 0.8, nDamageRand = 178 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 301 * 0.8, nDamageRand = 301 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 432 * 0.8, nDamageRand = 432 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 628 * 0.8, nDamageRand = 628 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 824 * 0.8, nDamageRand = 824 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1134 * 0.8, nDamageRand = 1134 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1352 * 0.8, nDamageRand = 1352 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1571 * 0.8, nDamageRand = 1571 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1789 * 0.8, nDamageRand = 1789 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2007 * 0.8, nDamageRand = 2007 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2225 * 0.8, nDamageRand = 2225 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2444 * 0.8, nDamageRand = 2444 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2662 * 0.8, nDamageRand = 2662 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 2880 * 0.8, nDamageRand = 2880 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3215 * 0.8, nDamageRand = 3215 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3288 * 0.8, nDamageRand = 3288 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3360 * 0.8, nDamageRand = 3360 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3433 * 0.8, nDamageRand = 3433 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3506 * 0.8, nDamageRand = 3506 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3579 * 0.8, nDamageRand = 3579 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3652 * 0.8, nDamageRand = 3652 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3724 * 0.8, nDamageRand = 3724 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3797 * 0.8, nDamageRand = 3797 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3870 * 0.8, nDamageRand = 3870 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3943 * 0.8, nDamageRand = 3943 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 4016 * 0.8, nDamageRand = 4016 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 4088 * 0.8, nDamageRand = 4088 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 4161 * 0.8, nDamageRand = 4161 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4234 * 0.8, nDamageRand = 4234 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 4307 * 0.8, nDamageRand = 4307 * 0.4, nCostMana = 0},		--level 31
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
 	
     skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
        0, 
        0
    );   

    skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.FREEZE,
	48,
        0
    );
    
    
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab

    --skill.SetPublicCoolDown(16);	--公共CD
   --skill.SetNormalCoolDown(2, 126);
	
	
    skill.nWeaponDamagePercent = 0;
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
    ----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- 技能施放的最大距离 

    skill.nAreaRadius        = 15 * LENGTH_BASE;   --技能施放范围距离
    skill.nAngleRange       = 256;  --施放角度
	skill.nTargetCountLimit	= 5;	-- 限定作用目标为4个
    
    --吟唱帧数
    skill.nPrepareFrames    = 48;
    
    ----------------- 打断相关 -------------------------------------------------
    skill.nBeatBackRate       = 0;		-- 技能被打退的概率,默认1024
    skill.nBrokenRate         = 0;		-- 技能被打断的概率,默认1024
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com