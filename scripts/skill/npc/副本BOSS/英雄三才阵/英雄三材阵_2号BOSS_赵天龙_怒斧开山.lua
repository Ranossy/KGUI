------------------------------------------------
-- 文件名    :  英雄三材阵_2号BOSS_赵天龙_怒斧开山.lua
-- 创建人    :  陈步高
-- 创建时间  :  2009-5-13
-- 用途(模块):  副本小怪
-- 武功门派  :  英雄三才
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
     {nDamageBase = 205  *0.8,  nDamageRand = 205  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 347  *0.8,  nDamageRand = 347  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 498  *0.8,  nDamageRand = 498  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 724  *0.8,  nDamageRand = 724  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 56},
     {nDamageBase = 951  *0.8,  nDamageRand = 951  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 1308 *0.8,  nDamageRand = 1308 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 64},
     {nDamageBase = 1560 *0.8,  nDamageRand = 1560 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 64},
     {nDamageBase = 1811 *0.8,  nDamageRand = 1811 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2063 *0.8,  nDamageRand = 2063 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2314 *0.8,  nDamageRand = 2314 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2566 *0.8,  nDamageRand = 2566 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 2818 *0.8,  nDamageRand = 2818 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3069 *0.8,  nDamageRand = 3069 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3321 *0.8,  nDamageRand = 3321 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3573 *0.8,  nDamageRand = 3573 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3824 *0.8,  nDamageRand = 3824 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4076 *0.8,  nDamageRand = 4076 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4327 *0.8,  nDamageRand = 4327 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4579 *0.8,  nDamageRand = 4579 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4831 *0.8,  nDamageRand = 4831 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},

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