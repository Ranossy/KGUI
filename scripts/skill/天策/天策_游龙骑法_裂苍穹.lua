------------------------------------------------
-- 文件名    :  天策_游龙骑法_裂苍穹.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-09-06
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法
-- 技能名称  :  裂苍穹
-- 技能效果  :  单体击退目标15米
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 54, nTime = 16, nDamage = 10, nDamageRand = 5},		-- Level 1
	{nCostMana = 62, nTime = 16, nDamage = 15, nDamageRand = 5},	
	{nCostMana = 70, nTime = 16, nDamage = 20, nDamageRand = 5},	
	{nCostMana = 79, nTime = 16, nDamage = 25, nDamageRand = 5},	
	{nCostMana = 87, nTime = 16, nDamage = 30, nDamageRand = 5}
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
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

	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.CALL_REPULSED,
	tSkillData[dwSkillLevel].nTime,  --速度
        0
    );
    
	--skill.BindBuff(1, 788, 1);	-- 减速95%Buff
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 189); 
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 152;	-- 技能消耗的内力
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 30;										--子弹速度,点/帧

	skill.nDismountingRate  = 1024;                 --落马率为100%
    
    skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断
   
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
	if skill.dwLevel == skill.dwMaxLevel then
		 player.AcquireAchievement(40)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com