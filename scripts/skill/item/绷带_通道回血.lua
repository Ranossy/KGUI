------------------------------------------------
-- ������    :  ����	
-- ����ʱ��  :  2009-03-13
-- ����Ч��  :  ����ͨ��3�룬ÿ���Ѫ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

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


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     	= false
	local dwSkillLevel	= skill.dwLevel
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY,						-- ���ƻ���ֵ
        tSkillData[dwSkillLevel].nTherapy, 
        0
    );
		
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,					-- ���Ƹ���ֵ
        tSkillData[dwSkillLevel].nTherapyRand, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,						-- Call����
        0, 
        0
    );
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
 --   skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0										-- ����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;						-- ����ʩ�����뾶
    skill.nAngleRange       = 256; 									-- ʩ�ŽǶ�
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
    skill.nChannelInterval	= GAME_FPS; 			-- ͨ�������ʱ�� 
    skill.nChannelFrame		= 3 * GAME_FPS;			-- ͨ��������ʱ�䣬��λ֡�� 
    skill.nBulletVelocity	= 0;					-- �ӵ��ٶȣ���λ ��/֡
    
    skill.nBreakRate        = 1024;					--����ϵĸ���,Ĭ��1024��ʾһ�������
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com