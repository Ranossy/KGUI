--�������⿡�ҽ��һ��BUFFһ��DEBUFF�༼��
--�º���
--08.03.19

--------------�Ҳ��Ƿָ���----------------------------------------------------

tSkillData =
{
	   	{nAddStamina = 7 ,nAddThew = 8 },
          {nAddStamina = 7 ,nAddThew = 8 },
          {nAddStamina = 8 ,nAddThew = 8 },
          {nAddStamina = 10 ,nAddThew = 12 },
          {nAddStamina = 10 ,nAddThew = 12 },
          {nAddStamina = 12 ,nAddThew = 13 },
          {nAddStamina = 12 ,nAddThew = 13 },
          {nAddStamina = 16 ,nAddThew = 18 },
  
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

			skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CURRENT_STAMINA, 
        	tSkillData[dwSkillLevel].nAddStamina,
        	0
    	);
    	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CURRENT_THEW, 
        	tSkillData[dwSkillLevel].nAddThew,
        	0
    	);

	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     skill.SetNormalCoolDown(1,132);
     skill.SetNormalCoolDown(2,130);
	
--������������-------
  
    --��������
   -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
   -- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
   -- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    skill.nPrepareFrames    = PRE_FRAMES;
    --�ӵ��ٶ�
   -- skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
  --  skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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