--������Ե������� ǧ������ һͳ����
--�书����
--�����书-����
--����Ч����˵������ID10000�ż��ܽ�����ϰ
--���� 2007-03-12

--------------����ķָ���-----------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
    local dwSkillLevel = skill.dwLevel;
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.PRACTICE_KUNG_FU, 
        10000,
        0
    );
	

    ----------------- ����������� ----------------------------------------
   
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 96;
    skill.nAngleRange       = 128; 
    skill.nChannelInterval    = 240;
	skill.nChannelFrame		= 9600;
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com