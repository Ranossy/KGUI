------------------------------------------------
-- 文件名    :  天策_虎牙令-徐如林.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-3 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  虎牙令
-- 技能名称  :  徐如林
-- 技能效果  :  每次被击中时恢复生命
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 17, nBuffID = 198, nBuffLevel = 1},		-- Level 1
	{nCostMana = 24, nBuffID = 198, nBuffLevel = 2},		-- Level 2
	{nCostMana = 31, nBuffID = 198, nBuffLevel = 3},		-- Level 3
	{nCostMana = 38, nBuffID = 198, nBuffLevel = 4},		-- Level 4
	{nCostMana = 45, nBuffID = 198, nBuffLevel = 5},		-- Level 5
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= 5;
	
	skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);

--施放 铁牢律的徐如林buff,需求铁牢律5级
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		593,
		dwSkillLevel
	);
--]]

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--公共CD
    skill.SetNormalCoolDown(1, 96);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/5)*67;	-- 技能消耗的内力
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
    skill.nAngleRange       = 128; 										--施放角度,全角256
    
    
    skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    
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
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com