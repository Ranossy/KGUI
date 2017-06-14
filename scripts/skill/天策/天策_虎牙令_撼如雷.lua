---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_虎牙令_撼如雷.lua
-- 更新时间:	2013/6/7 5:01:30
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_虎牙令_撼如雷.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-02-26 16:14	
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  撼如雷
-- 技能效果  :  在不同内功下效果不同
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 13, nBuffLevel = 1}, -- Level 1
	{nCostMana = 21, nBuffLevel = 2}, -- Level 2
	{nCostMana = 28, nBuffLevel = 3}, -- Level 3
	{nCostMana = 35, nBuffLevel = 4}, -- Level 4
	{nCostMana = 42, nBuffLevel = 5}, -- Level 5
	{nCostMana = 49, nBuffLevel = 6}, -- Level 6
	{nCostMana = 49, nBuffLevel = 7}, -- Level 6
	{nCostMana = 49, nBuffLevel = 8}, -- Level 6
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	
	--施放 撼如雷_傲血战意 ID=444
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		444,
		dwSkillLevel
	);
	
--	--施放 撼如雷_铁牢律 ID=445
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		445,
--		dwSkillLevel
--	);

	skill.BindBuff(1, 362, tSkillData[dwSkillLevel].nBuffLevel);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 94);
	skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 600;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 30 * LENGTH_BASE;
	skill.nTargetCountLimit = 30;
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