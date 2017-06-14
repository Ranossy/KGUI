------------------------------------------------
-- 文件名    :  天策_子技能_破风_破甲.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-6-19
-- 用途(模块):  武功技能
-- 武功门派  :  天策	
-- 武功类型  :  外功
-- 武功套路  :  是
-- 技能名称  :  破风子技能
-- 技能效果  :  装备铁牢律下,在坚韧buff存在的时候,破风能利用坚韧对目标造成破甲效果,
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nThreat = 265},		-- Level 1
	{nThreat = 325},		-- Level 2
	{nThreat = 385},		-- Level 3
	{nThreat = 445},		-- Level 4
	{nThreat = 505},		-- Level 5
	{nThreat = 565},		-- Level 6
	{nThreat = 625},		-- Level 7
	{nThreat = 685},		-- Level 8
	{nThreat = 745},		-- Level 9
	{nThreat = 805},		-- Level 10
	{nThreat = 865},		-- Level 11
	{nThreat = 925}, 		-- Level 12
	{nThreat = 985}, 		-- Level 13
	{nThreat = 1045},		-- Level 14
	{nThreat = 1105},		-- Level 15
	{nThreat = 1165},		-- Level 16
	{nThreat = 1225},		-- Level 17
	{nThreat = 1285},		-- Level 18
	{nThreat = 1345},		-- Level 19
	{nThreat = 1405},		-- Level 20
	{nThreat = 1465},		-- Level 21
	{nThreat = 1525},		-- Level 22
	{nThreat = 1585},		-- Level 23
	{nThreat = 1645},		-- Level 24
	{nThreat = 1705}, 		-- Level 25
};                 
                   
                   
--设置武功技能级别相关数值
function GetSkillLevelData(skill)
                   
	local bRetCode     = false;
	local dwSkillLevel =skill.dwLevel
	               

	skill.BindBuff(1,552,dwSkillLevel);

    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 技能仇恨 -------------------------------------------------
	skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
	--skill.AddSlowCheckSelfBuff(10039, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
 
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius        = 4 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange       = 128; 									--施放角度
    
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

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com