--�����ҽ������
--���
--08.03.24
--�޸���ֵ������
--09.06.05

-----------------------�����ķָ���----------------------------------------------------

tSkillData =
{
         {nAddHealth = 350,nAddMana = 450 },
         {nAddHealth = 900,nAddMana = 1050},
         {nAddHealth = 1000,nAddMana =1100},
         {nAddHealth = 1200,nAddMana =1250},
         {nAddHealth = 1500,nAddMana =1700},
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	
		skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	        ATTRIBUTE_TYPE.THERAPY_POWER_PERCENT,
	        -1024,
	        0
	    );
		skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
	        ATTRIBUTE_TYPE.CALL_THERAPY,
	        tSkillData[dwSkillLevel].nAddHealth,
	        0
	    );
        skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CURRENT_MANA, 
       		tSkillData[dwSkillLevel].nAddMana,
        	0
    	);
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     skill.SetNormalCoolDown(1,76);
     skill.SetNormalCoolDown(2,133);
	
--������������-------
  
    --��������
   -- skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
   -- skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
   -- skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    --skill.nPrepareFrames    = PRE_FRAMES;
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
	if IsPlayer(npc.dwID) and npc.dwShapeShiftID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
	end
	return nPreResult;
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com