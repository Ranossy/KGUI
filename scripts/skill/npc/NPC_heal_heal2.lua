--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-����ӳ������Ƽ���
--����Ч����˵�������Ƽ���
--���� 2006-8-17

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    nLifeAdd = 15, nCostMana = 5
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY, 
        tSkillData.nLifeAdd,
        0
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY, 
        0,
        0
    );
	----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    skill.SetNormalCoolDown(1, 7);
    
    ----------------- ����������� ----------------------------------------
  
    --��������
    skill.nCostMana         = tSkillData.nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 10 * LENGTH_BASE;
    skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 16;
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