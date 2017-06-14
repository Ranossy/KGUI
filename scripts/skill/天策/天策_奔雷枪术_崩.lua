------------------------------------------------
-- 文件名    :  天策_奔雷枪术_崩.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-09-06
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  崩
-- 技能效果  :  伤害技能,打断目标施法,如果成功则造成3倍伤害,禁止使用技能5秒.
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 40, nDamage = 78 *0.95, nDamageRand = 78 *0.1},		-- Level 1	
	{nCostMana = 51, nDamage = 99 *0.95, nDamageRand = 99 *0.1},		-- Level 2  
	{nCostMana = 62, nDamage = 120*0.95, nDamageRand = 120*0.1},		-- Level 3  
	{nCostMana = 73, nDamage = 141*0.95, nDamageRand = 141*0.1},		-- Level 4  
	{nCostMana = 84, nDamage = 162*0.95, nDamageRand = 162*0.1}		-- Level 5  
  
};



--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= 5;
	

	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD1秒
    skill.SetNormalCoolDown(1, 190);
    skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
skill.nCostManaBasePercent = 137;	-- 技能消耗的内力
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nWeaponDamagePercent	= 1024;
	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
	skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	skill.nBreakRate	= 1024;									--打断施法概率
  	--skill.nChannelInterval	= 32;									--2倍AP加成
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