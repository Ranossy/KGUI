------------------------------------------------
-- ������    :  hanzhengchun
-- ����ʱ��  :  2010-4-21
-- ����Ч��  :  ������Ѫ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 375, nTherapyRand = 375, nCostMana = 0}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

  local bRetCode     	= false
	local dwSkillLevel	= skill.dwLevel

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,						-- Call����
        375, 
        0
    );
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
    skill.SetNormalCoolDown(1, 359);
	  --skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		--skill.AddSlowCheckDestBuff(1847, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL); 
		--skill.BindBuff(1, 1846, 4);
	----------------- ���ü������� ---------------------------------------------------------------------
		--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    --------------- ����������� ----------------------------------------------------------------------
   
    -- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0										-- ����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;						-- ����ʩ�����뾶
    skill.nAngleRange       = 256; 									-- ʩ�ŽǶ�
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
    skill.nChannelInterval	= GAME_FPS; 			-- ͨ�������ʱ�� 
    skill.nChannelFrame		= 6 * GAME_FPS;			-- ͨ��������ʱ�䣬��λ֡�� 
   -- skill.nBulletVelocity	= 0;					-- �ӵ��ٶȣ���λ ��/֡
    
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


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com