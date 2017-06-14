------------------------------------------------
-- 文件名    :  灵霄峡_1号BOSS_枪法·横尾.lua
-- 创建人    :  陈步高
-- 创建时间  :  2009-3-10
-- 用途(模块):  副本小怪
-- 武功门派  :  灵霄峡
-- 武功类型  :  外功
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  击倒并造成伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 24},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 28},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 32},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 36},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 40},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 50},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 50},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 52},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 52},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 54},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 54},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 56},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 200*0.8,  nDamageRand = 200*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 62},
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
 
    skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
	tSkillData[dwSkillLevel].nTime,
        0
    );
	

 skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID, tSkillData[dwSkillLevel].nBuffLevel);		-- 设置1号位Buff   
    
    
	
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
    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- 技能施放的最大距离

    skill.nAreaRadius        = 3 * LENGTH_BASE;   --技能施放范围距离
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