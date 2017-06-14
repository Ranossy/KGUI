------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_���.lua
-- ������    :  ����	
-- ����ʱ��  :  2009-8-19
-- ��;(ģ��):  �书����
-- �书����  :  ���	
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nThreat = 259    },		-- Level 1
	{nThreat = 389    },		-- Level 2
	{nThreat = 518    },		-- Level 3
	{nThreat = 648    },		-- Level 4
	{nThreat = 778    },		-- Level 5
	{nThreat = 907    },		-- Level 6
	{nThreat = 1037   },		-- Level 7
	{nThreat = 1166   },		-- Level 8
	{nThreat = 1296   },		-- Level 9
	{nThreat = 1858   },		-- Level 10
};                 
                   
                   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
                   
	local bRetCode     = false;
	local dwSkillLevel =skill.dwLevel
	               

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ܳ�� -------------------------------------------------
	skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- ����������� ----------------------------------------------------------------------
	--skill.AddSlowCheckSelfBuff(10039, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
 
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com