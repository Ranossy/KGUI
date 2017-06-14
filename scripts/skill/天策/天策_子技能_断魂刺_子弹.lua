------------------------------------------------
-- 文件名    :  天策_子技能_断魂刺_子弹.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-06
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  游龙骑法
-- 技能名称  :  断魂刺_子弹
-- 技能效果  :  伴随断魂刺Dash,造成伤害和击倒,子弹飞行速度和Dash速度相同
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 0, nDamage = 26, nDamageRand = 3},	-- Level 1
     {nCostMana = 0, nDamage = 28, nDamageRand = 3},	-- Level 2
     {nCostMana = 0, nDamage = 33, nDamageRand = 3},	-- Level 3
     {nCostMana = 0, nDamage = 35, nDamageRand = 3},	-- Level 4
     {nCostMana = 0, nDamage = 36, nDamageRand = 3},	-- Level 5
     {nCostMana = 0, nDamage = 38, nDamageRand = 3},	-- Level 6
     {nCostMana = 0, nDamage = 39, nDamageRand = 3},	-- Level 7
};
tPit =                         
{                              
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},

                               
                               
}                              


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 2275, 1);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage* (1 - tPit[dwSkillLevel].nReducePercent), 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand* (1 - tPit[dwSkillLevel].nReducePercent), 
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
		ATTRIBUTE_TYPE.CALL_BUFF,
		540,
		1
    	);

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒

	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent		= 1024;
	
	skill.nMinRadius	= 5* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 25 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange	= 256; 										--施放角度,全角256
    
	skill.nPrepareFrames	= 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity	= 100;										--子弹速度,点/帧
    
	skill.nBreakRate	= 0;									--被打断的概率,默认1024表示一定被打断
   
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