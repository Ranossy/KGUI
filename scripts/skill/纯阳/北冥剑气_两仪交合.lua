------------------------------------------------
-- 文件名    :  北冥剑气_两仪交合.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  北冥剑气
-- 技能名称  :  两仪交合
-- 技能效果  :  单体伤害技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{	
	{nCostMana = 41},   	--level 1 
 	{nCostMana = 74},   	--level 2 
    {nCostMana = 127},  	--level 3 
    {nCostMana = 164},  	--level 4 
    {nCostMana = 200},  	--level 5 
    {nCostMana = 237},	    --level 6 
    {nCostMana = 273},	    --level 7 
    {nCostMana = 273},	    --level 8
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     	= false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.bIsAccumulate = true;
    skill.SetSubsectionSkill(1, 1, 317, dwSkillLevel);   	-- 1点气
    skill.SetSubsectionSkill(2, 2, 318, dwSkillLevel);		--
    skill.SetSubsectionSkill(3, 3, 319, dwSkillLevel);		--
    skill.SetSubsectionSkill(4, 4, 320, dwSkillLevel);		--
    skill.SetSubsectionSkill(5, 5, 321, dwSkillLevel);		--
    skill.SetSubsectionSkill(6, 6, 456, dwSkillLevel);		--
    skill.SetSubsectionSkill(7, 7, 457, dwSkillLevel);		--
    skill.SetSubsectionSkill(8, 8, 458, dwSkillLevel);		--
    skill.SetSubsectionSkill(9, 9, 459, dwSkillLevel);		--
    skill.SetSubsectionSkill(10, 10, 460, dwSkillLevel);	-- 10点气
    
    
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    skill.SetPublicCoolDown(16);	--公共CD
    skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 7 then
		skill.nCostManaBasePercent = 420*0.65*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 14 then
		skill.nCostManaBasePercent = 420*0.65 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 21 then
		skill.nCostManaBasePercent = 420*0.65*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 28 then
		skill.nCostManaBasePercent = 420*0.65*0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 420*0.65;	-- 技能消耗的内力
	end
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;						--技能施放最大半径
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(65)
	end
	--满级新手指引任务
	--local nQuestIndex = player.GetQuestIndex(13420)
	--local nQuestPhase = player.GetQuestPhase(13420)
	--if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, skill.dwLevel)
	--end
	-- if player.IsAchievementAcquired(61) and player.IsAchievementAcquired(62) and player.IsAchievementAcquired(63) and player.IsAchievementAcquired(64) and player.IsAchievementAcquired(65) and player.IsAchievementAcquired(66) and player.IsAchievementAcquired(67) then
		-- player.AcquireAchievement(72)
	-- end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com