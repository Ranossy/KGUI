------------------------------------------------
-- 文件名    :  江湖_aoe.lua
-- 创建人    :  刘恒志	
-- 创建时间  :  2008-4-28
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  江湖功夫
-- 技能名称  :  
-- 技能效果  :  范围伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	 {nDamage = 40,  nCostMana = 42},
	{nDamage = 56,  nCostMana = 64},
	{nDamage = 72,  nCostMana = 80},
     
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel

	skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	        ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT, 
	        -1024,
	        0
   	 );
	
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
	
	skill.SetPublicCoolDown(16);	--公共CD
    skill.SetNormalCoolDown(1, 503);	--明教1秒GCD
	skill.SetNormalCoolDown(2, 126);
	skill.SetCheckCoolDown(1, 444)
	
	skill.nWeaponDamagePercent = 0;
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- 设置杂项参数 ----------------------------------------------------------------------
	
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nMaxRadius		= 6 * LENGTH_BASE;
	skill.nAreaRadius        	= 6 * LENGTH_BASE;   --技能施放范围距离
	skill.nAngleRange       	= 256;  --施放角度
	skill.nTargetCountLimit	= 4;	-- 限定作用目标为4个
	
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	
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