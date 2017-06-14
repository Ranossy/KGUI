------------------------------------------------
-- 文件名    :  天工坊_2号BOSS_平三指_自爆.lua
-- 创建人    :  吴娟
-- 创建时间  :  2009-3-10
-- 用途(模块):  武功技能
--技技能周期	90     
--施施放次数(此处默认45
--预预计最少命中目标个?
--吟吟唱时间(瞬发技能填
--施施放角度(全角度256)
--AOAOE作用目标个数(非A
--AOAOE半径(最大24,非AO
--BUBUFF预计命中层数(直
--BUBUFF每跳间隔(直接伤
--BUBUFF跳数(直接伤害填
--BUBUFF最大可叠加层数(
--		               
--		               
--		               
--提提高自身伤害百分比	
--单单次持续时间	30.
--预预计施放次数	1.0
--伤伤害百分比	48%    
--单单体爆发力(普通攻击
--AOAOE能力	2.08       
--综综合爆发力	1.68   
--In强度系数	0.33   

------------------------------------------------


--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 1		0-4  
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 2		5-9  
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 3		10-14
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 4		15-19
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 5		20-24
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 6		25-29
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 7		30-34
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 8		35-39
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 9		40-44
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 10		45-49
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 11		50-54
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 12		55-59	                                           
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 13		60-64
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 14		65-69
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 15		70-74
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 16		75-79
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 17		80-84
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 18		85-89
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 19		90-94
	{nDamageBase = 150*0.8, nDamageRand = 150*0.4, nCostMana = 38},		--level 20		95-99
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
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,  				--35级BOSS强度，用第八级 
        0, 
        0
    );

--	skill.BindBuff(1,tSkillData[dwSkillLevel].nDebuffID, tSkillData[dwSkillLevel].nDebuffLevel)

    
    
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
	--skill.SetNormalCoolDown(1, 151);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	----------------- 打退打断落马相关 -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--Skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;		-- 技能施放的最大距离
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius       = 20 * LENGTH_BASE;
	skill.nPrepareFrames  	= 48;					-- 吟唱帧数
   -- skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    --skill.nWeaponDamagePercent		= 0;
    skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	--skill.nTargetCountLimit	= 5;
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	local dwNpcLife = npc.nCurrentLife;
	local dwNpcMaxLife = npc.nMaxLife;
    
	if dwNpcLife  <  dwNpcMaxLife*0.1 then
	else
		return false;
	end
    
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end
function Apply(dwCharacterID)
end
function OnSkillLevelUp(skill, player)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com