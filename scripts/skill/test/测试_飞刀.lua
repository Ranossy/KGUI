--������Ե������� ǧ������ һͳ����
--�书����
--��������-�����书-��������
--����Ч����˵�������ù������ܣ�Զ�������˺���
--���� 2006-11-28

--------------����ķָ���-----------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, 
        0, 
        0
    );

    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(2, 209);
	----------------- BUFF��� -------------------------------------------------
    skill.BindBuff(1, 789, 1);		-- ����1��λBuff
    ----------------- ����������� ----------------------------------------
   
    --��������
    --skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    

    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMinRadius        = 0;
    skill.nMaxRadius        = 50 * LENGTH_BASE;
    skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 0;
    
    skill.nBulletVelocity   = 0;	--�ӵ��ٶȣ���λ��/֡
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


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com