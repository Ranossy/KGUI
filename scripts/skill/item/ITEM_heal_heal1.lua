--������Ե������� ǧ������ һͳ����
--�书����
--���߼���-��Ѫ�ݵ�����
--����Ч����˵������������
--���� 2006-9-6

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nLifeAdd = 15},
    {nLifeAdd = 15},
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY, 
        tSkillData[dwSkillLevel].nLifeAdd,
        0
    );
    ----------------- ����������� ----------------------------------------

    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 10 * LENGTH_BASE;
    skill.nAngleRange       = 360; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 1000;
   
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