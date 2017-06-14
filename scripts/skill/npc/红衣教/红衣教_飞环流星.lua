------------------------------------------------
-- 文件名    :  红衣教_飞环流星.lua
-- 创建人    :  陈步高	
-- 创建时间  :  2008-08-27
-- 用途(模块):  武功技能
-- 武功门派  :  红衣教
-- 武功类型  :  外功
-- 武功套路  :  MPC技能
-- 技能名称  :  飞环流星
-- 技能效果  :  对远程目标造成X点外功伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nCostMana = 0, nDamage = 9 },		-- Level 1
	{ nCostMana = 0, nDamage = 15 },		-- Level 2
	{ nCostMana = 0, nDamage = 22 },		-- Level 3
	{ nCostMana = 0, nDamage = 35 },		-- Level 4
	{ nCostMana = 0, nDamage = 44 },		-- Level 5
	{ nCostMana = 0, nDamage = 56 },		-- Level 6
	{ nCostMana = 0, nDamage = 70 },		-- Level 7
	{ nCostMana = 0, nDamage = 88 },		-- Level 8
	{ nCostMana = 0, nDamage = 103 },		-- Level 9
	{ nCostMana = 0, nDamage = 128},		-- Level 10
	{ nCostMana = 0, nDamage = 143 },		-- Level 11
	{ nCostMana = 0, nDamage = 188 },		-- Level 12
	{ nCostMana = 0, nDamage = 243 },		-- Level 13
	{ nCostMana = 0, nDamage = 337 },		-- Level 14
	{ nCostMana = 0, nDamage = 438 },		-- Level 15
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);
	
	

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------

    skill.nMinRadius		= 5 * LENGTH_BASE;	--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;	      --技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
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