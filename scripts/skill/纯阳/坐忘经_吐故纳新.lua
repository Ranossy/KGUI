---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/坐忘经_吐故纳新.lua
-- 更新时间:	2013/4/22 16:34:03
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  坐忘经_吐故纳新.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  无极功
-- 技能名称  :  吐故纳新
-- 技能效果  :  当角色受到攻击时，剑气自动反击目标。
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nBuffID = 136, nBuffLevel = 1, nCostMana = 98}, --level 1         
	{nBuffID = 136, nBuffLevel = 2, nCostMana = 128}, --level 2         
	{nBuffID = 136, nBuffLevel = 3, nCostMana = 158}, --level 3         
	{nBuffID = 136, nBuffLevel = 4, nCostMana = 189}, --level 4         
	{nBuffID = 136, nBuffLevel = 5, nCostMana = 219}, --level 5         
	{nBuffID = 136, nBuffLevel = 6, nCostMana = 249}, --level 6          
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.BindBuff(1, 136, 6)
	skill.BindBuff(3, 1241, 2, false, 20);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 245);	
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 221;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 1024;									--打断的概率,默认1024表示一定打断
       
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com