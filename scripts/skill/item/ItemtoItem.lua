--������Ե������� ǧ������ һͳ����
--�书����
--����-�նɹ����ڶ�ʽ-�޺�����
--����Ч����˵��������������ʱ�������ͷţ��˺��еȡ�
--�Ϸ� 2006-5-15

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nMaxRadius = 5},
};


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;

    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, tSkillData[dwSkillLevel].nCoolDownID1);
	
    
    ----------------- ����������� ----------------------------------------
   
    --��������
    --skill.dwLevelUpExp      = dwSkillLevel * 10 + 100;    
    --��������
   -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;       
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    --skill.nAngleRange       = 128; 
    --����֡��
   -- skill.nPrepareFrames    = 4;
    --�ӵ��ٶ�
    --skill.nBulletVelocity   = 3;
    --����ϵĸ���
   -- skill.nBreakRate        = 1000;
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return true;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com