------------------------------------------------
-- 创建人    :  王洋	
-- 创建时间  :  2009-03-13
-- 技能效果  :  单体通道3秒，每秒回血
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
		{nTherapy = 202/3*0.95, nTherapyRand = 202/3*0.1, nCostMana = 42 },
		{nTherapy = 288/3*0.95, nTherapyRand = 288/3*0.1, nCostMana = 61 },
		{nTherapy = 374/3*0.95, nTherapyRand = 374/3*0.1, nCostMana = 88 },
		{nTherapy = 461/3*0.95, nTherapyRand = 461/3*0.1, nCostMana = 108},
		{nTherapy = 547/3*0.95, nTherapyRand = 547/3*0.1, nCostMana = 129},
		{nTherapy = 634/3*0.95, nTherapyRand = 634/3*0.1, nCostMana = 149},
		{nTherapy = 720/3*0.95, nTherapyRand = 720/3*0.1, nCostMana = 170},
		{nTherapy = 806/3*0.95, nTherapyRand = 806/3*0.1, nCostMana = 190},
		{nTherapy = 893/3*0.95, nTherapyRand = 893/3*0.1, nCostMana = 211}
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     	= false
	local dwSkillLevel	= skill.dwLevel
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY,						-- 治疗基础值
        tSkillData[dwSkillLevel].nTherapy, 
        0
    );
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,					-- 治疗浮动值
        tSkillData[dwSkillLevel].nTherapyRand, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,						-- Call治疗
        0, 
        0
    );
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);
 --   skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- 设置杂项参数 ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0										-- 技能施放最小半径
    skill.nMaxRadius        = 20 * LENGTH_BASE;						-- 技能施放最大半径
    skill.nAngleRange       = 256; 									-- 施放角度
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- 吟唱帧数
    skill.nChannelInterval	= GAME_FPS; 			-- 通道技间隔时间 
    skill.nChannelFrame		= 3 * GAME_FPS;			-- 通道技持续时间，单位帧数 
    skill.nBulletVelocity	= 0;					-- 子弹速度，单位 点/帧
    
    skill.nBreakRate        = 1024;					--被打断的概率,默认1024表示一定被打断
    
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end

--function OnSkillLevelUp(skill, player)
--	if skill.dwLevel == 9 then
--		 player.AcquireAchievement(54)
--	end
--	if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
--		player.AcquireAchievement(70)
--	end
--end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com