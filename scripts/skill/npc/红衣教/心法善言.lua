--������Ե������� ǧ������ һͳ����
--�书����
--NPC����-BUFF�༼��
--����Ч����˵������Ŀ��һ��Buff
--�º��� 08.01.21
--���½� 
--�ķ�����

-------------------------------------------------------------��ѽ��ָ���ѽ-----------------------------------------------------

tSkillData =
{
   {nCostMana = 36,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 67,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 97,  nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 120, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
   {nCostMana = 157, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024}, 
	 {nCostMana = 187, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 213, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 225, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 235, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 243, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 250, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 278, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 305, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 332, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024},
	 {nCostMana = 360, nMaxRadius = 5, nAngleRange = 256, nPrepareFrames = 0, nBulletVelocity = 0, nBreakRate = 1024}
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        194,
        dwSkillLevel
    );
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--������������-------
  
    --��������
    skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = tSkillData[dwSkillLevel].nMaxRadius * LENGTH_BASE;
    skill.nAngleRange       = tSkillData[dwSkillLevel].nAngleRange; 
    --����֡��
    skill.nPrepareFrames    = tSkillData[dwSkillLevel].nPrepareFrames;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
    skill.nBreakRate        = tSkillData[dwSkillLevel].nBreakRate;
   
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