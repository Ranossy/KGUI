------------------------------------------------
-- 文件名    :  天策_奔雷枪术_突.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-04 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  奔雷枪术
-- 技能名称  :  突
-- 技能效果  :  从空中冲下,造成单体伤害,能在跳跃中使用
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 34, nCostMana = 63 , nDashSpeed = 120},   	-- Level 1 Dash速度单位 点/帧
	{nDamage = 44, nCostMana = 83 , nDashSpeed = 120},		-- Level 2
	{nDamage = 54, nCostMana = 103, nDashSpeed = 120},		-- Level 3
	{nDamage = 65, nCostMana = 122, nDashSpeed = 120},		-- Level 4
	{nDamage = 75, nCostMana = 142, nDashSpeed = 120},		-- Level 5
	{nDamage = 86, nCostMana = 162, nDashSpeed = 120},		-- Level 6
};           
             

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);

	----------------- BUFF相关 -------------------------------------------------
		skill.BindBuff(1, 1753, 1);		-- 设置1号位Buff
		--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
		--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
		--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 98);
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius        = 25 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange       = 128; 										--施放角度,全角256
    --skill.nWeaponDamagePercent	= 0;
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

function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com