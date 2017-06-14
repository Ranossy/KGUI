------------------------------------------------
-- �ļ���    :  ���_�����¼�_��_���ӳ��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-9-19
-- ��;(ģ��):  �书����
-- �书����  :  ���	
-- �书����  :  �⹦
-- �书��·  :  ��
-- ��������  :  �����¼�
-- ����Ч��  :  ��������Ŀ�����Ӵ������
------------------------------------------------

tSkillData =
{
	{nThreat = 331  },		-- Level 1
	{nThreat = 452  },		-- Level 2
	{nThreat = 572  },		-- Level 3
	{nThreat = 693  },		-- Level 4
	{nThreat = 813  },		-- Level 5
	{nThreat = 933  },		-- Level 6

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
	
	--����cool down------

	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

    -- skill.SetNormalCoolDown(1,7);
	
	--������������-------
  	----------------- ���ܳ�� -------------------------------------------------
	skill.nBaseThreat		= tSkillData[dwSkillLevel].nThreat;
  	
    --��������
	--skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
 	skill.nMaxRadius        = 100* LENGTH_BASE;
  	skill.nAngleRange       = 256; 
 	skill.nAreaRadius		= 100* LENGTH_BASE;
    --����֡��
  	--  skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --�ӵ��ٶ�
  	--  skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
   	-- skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com