------------------------------------------------
-- �ļ���    :  ��Ʒ�����ͷ�.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-8-22
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  �����书
-- ��������  :  ��Ʒ���ܲ���
-- ����Ч��  :  ��Ʒ����
------------------------------------------------

--------------�����Ǽ���----------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        597,		--IDΪ700��Hot
        1			--LevelΪ1
    );

    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	
	--skill.SetNormalCoolDown(1, 2);
	
    ----------------- ����������� ----------------------------------------

    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 15 * LENGTH_BASE;
    skill.nAngleRange       = 256; 	--ȫ��λ
    --����֡��
    skill.nPrepareFrames    = 0;	--˲��
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 1000;
    --����
	--IsFormationSkill		= true
    --��ѡ��Χ ��ѡ��Χ��������������ж�--
    --FormationRange 			= 30	
    --��Χ��Ա����
	--LeastFormationPopulation= 2			
      
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