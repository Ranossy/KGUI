------------------------------------------------
-- 文件名    : 空雾峰_BOSS3_初景·雪风.lua
-- 创建人    :  陈步高
-- 创建时间  :  2009-3-10
-- 用途(模块):  副本小怪
-- 武功门派  :  空雾峰
-- 武功类型  :  3号BOSS
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  点穴造成伤害并定身5秒
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 64},		--level 1
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 68},		--level 2
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 72},		--level 3
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 76},		--level 4
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 80},		--level 5
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 84},		--level 6
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 88},		--level 7
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 92},		--level 8
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 96},		--level 9
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 100},		--level 10
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 104},		--level 11
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 108},		--level 12
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 112},		--level 13
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 116},		--level 14
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 120},		--level 15
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 124},		--level 16
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 128},		--level 17
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 132},		--level 18
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 136},		--level 19
	{nDamageBase = 180  *0.8, nDamageRand = 180 *0.4, nCostMana = 0, nTime = 140},		--level 20
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
	
           skill.BindBuff(1,1000,1);		-- 设置1号位Buff 
    
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab

    --skill.SetPublicCoolDown(16);	--公共CD
   --skill.SetNormalCoolDown(2, 126);
	
	
    skill.nWeaponDamagePercent = 0;
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
    ----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 5 * LENGTH_BASE;		-- 技能施放的最大距离 


    skill.nAreaRadius        = 6 * LENGTH_BASE;   --技能施放范围距离
    skill.nAngleRange       = 128;  --施放角度
  -- skill.nTargetCountLimit	= 3;	-- 限定作用目标为4个
    
   -- skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
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